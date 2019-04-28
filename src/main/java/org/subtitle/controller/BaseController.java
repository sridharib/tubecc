package org.subtitle.controller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.mozilla.universalchardet.UniversalDetector;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.subtitle.utils.OpenSubtitles;

@Controller
public class BaseController {

	private static int counter = 0;
	private static final String VIEW_INDEX = "index";
	private static final String VIEW_EMBED = "embed";
	private Map<String, String> pathMap = new HashMap<>();
	private final static org.slf4j.Logger logger = LoggerFactory.getLogger(BaseController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(ModelMap model) {
		model.addAttribute("message", "Welcome");
		model.addAttribute("counter", ++counter);
		logger.debug("[welcome] counter : {}", counter);

		// Spring uses InternalResourceViewResolver and return back index.jsp
		return VIEW_INDEX;

	}
	
	@RequestMapping(value = "/embed", method = RequestMethod.GET)
	public String embed(ModelMap model) {
		model.addAttribute("message", "embed");
		model.addAttribute("counter", ++counter);
		logger.debug("[welcome] counter : {}", counter);

		// Spring uses InternalResourceViewResolver and return back embed.jsp
		return VIEW_EMBED;

	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody String doUpload(@RequestParam("file") MultipartFile multipartFile) throws IOException {
		String path = ".";
		File tmpFile = File.createTempFile(multipartFile.getName(), "", new File(path));
		tmpFile.deleteOnExit();
		multipartFile.transferTo(tmpFile);
		// if (multipartFile.getOriginalFilename().toLowerCase().endsWith(".srt"))
		toVTT(tmpFile.getAbsolutePath());

		pathMap.put(tmpFile.getName(), tmpFile.getAbsolutePath());
		return tmpFile.getName();
	}

	@RequestMapping(value = "/uploados", method = RequestMethod.POST)
	public @ResponseBody String doUploadOs(@RequestParam("ospath") String ospath) throws IOException {
		String path = ".";
		ospath = ospath.replaceAll(".gz", ".srt");
		File tmpFile = File.createTempFile("sub", "", new File(path));
		FileUtils.copyURLToFile(new URL(ospath), tmpFile);
		tmpFile.deleteOnExit();
		toVTT(tmpFile.getAbsolutePath());

		pathMap.put(tmpFile.getName(), tmpFile.getAbsolutePath());
		return tmpFile.getName();
	}

	@RequestMapping(value = "/file/{fileName:.+}", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public Resource getFile(@PathVariable String fileName) throws IOException {
		return new FileSystemResource(pathMap.get(fileName));
	}

	@RequestMapping(value = "/title", method = RequestMethod.POST)
	public @ResponseBody String getTitle(@RequestParam("url") String url) {
		if (url != null && !url.equals("")) {
			Document doc;
			try {
				doc = Jsoup.connect(url).get();
				return doc.title();
			} catch (IOException e) {
				logger.error(e.getMessage());
			}
		}
		return "";
	}

	@RequestMapping(value = "/subtitle", method = RequestMethod.POST)
	public @ResponseBody Map<?, ?> getSubTitle(@RequestParam("title") String title) throws IOException {
		OpenSubtitles openSubtitles = new OpenSubtitles("sridhariyer", "Dell@123", "");
		return openSubtitles.search(title);
	}

	private void toVTT(String path) throws IOException {
		UniversalDetector detector = new UniversalDetector(null);
		byte[] content = Files.readAllBytes(Paths.get(path));
		detector.handleData(content, 0, content.length);
		detector.dataEnd();

		String encoding = detector.getDetectedCharset();
		encoding = (encoding == null) ? StandardCharsets.UTF_8.toString() : encoding;
		String fileContent = "";
		try {

			fileContent = new String(content, encoding);
		} catch (Exception e) {
			logger.error("Encoding not supported. " + encoding + "." + e.getMessage());
			fileContent = new String(content);
		}
		// fileContent = "WEBVTT " + fileContent;
		// fileContent =
		// fileContent.replaceAll("(\\d\\d:\\d\\d:\\d\\d),(\\d\\d\\d)",
		// "$1.$2");

		FileWriter writer = new FileWriter(path);
		writer.write(fileContent);
		writer.close();
		detector.reset();

	}

}