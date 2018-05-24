package org.mvc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.mvc.domain.FileVO;
import org.mvc.service.FileService;
import org.mvc.util.UploadFileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class FileController {
	
	@Setter(onMethod_= {@Autowired})
	FileService service;

	@PostMapping("/uploadAjax")
	@ResponseBody
	public ResponseEntity<List<FileVO>> uploadAjaxPost(MultipartFile[] uploadFile) {

		List<FileVO> list = new ArrayList<>();
		String uploadFolder = "C:\\zzz\\upload";
		String uploadFolderPath = UploadFileUtils.getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		// File.exists 지정한 파일이 있는지 확인
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		} // make date folder

		for (MultipartFile multipartFile : uploadFile) {
			FileVO fileVO = new FileVO();
			String uploadFileName = multipartFile.getOriginalFilename();

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			fileVO.setFname(uploadFileName);

			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				log.info(saveFile.toString());

				fileVO.setAddress(saveFile.toString());
				fileVO.setUuid(uuid.toString());
				fileVO.setDatefolder(uploadFolderPath);
				if (UploadFileUtils.checkImageType(saveFile)) {
					fileVO.setImage("y");
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}else {
					fileVO.setImage("n");
				}
				service.fileInsert(fileVO);
				list.add(fileVO);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	
	@GetMapping(value="/download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent")String userAgent, String fileName){
		Resource resource = new FileSystemResource("C:\\zzz\\upload\\"+fileName);
		
		if(resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		String resourceName = resource.getFilename();
		
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		
		HttpHeaders headers = new HttpHeaders();
		try {
			boolean checkIE = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);
			String downloadName = null;
			
			if(checkIE) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
			}else {
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			headers.add("Content-Disposition", "attachment; filename=" + downloadName);
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(resource, HttpStatus.OK);
	}
	
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		File file = new File("C:\\zzz\\upload\\"+fileName);
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		File file;
		
		log.info(fileName);
		log.info(type);
		
		try {
			file = new File("C:\\zzz\\upload\\"+URLDecoder.decode(fileName,"UTF-8"));
			log.info("file+++++++++++++++++++++++" + file);
			file.delete();
			log.info("delete dddddddddddddddddddddd");
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("+++++++++++++++++++++++++++++++++++++++++" + largeFileName);
				file = new File(largeFileName);
				file.delete();
			}
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}





















