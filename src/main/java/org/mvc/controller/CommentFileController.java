package org.mvc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.mvc.domain.CommentFileVO;
import org.mvc.domain.FileVO;
import org.mvc.service.CommentFileService;
import org.mvc.util.UploadFileUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/comment/*")
public class CommentFileController {

	@Setter(onMethod_ = { @Autowired })
	private CommentFileService service;

	@PostMapping("/uploadAjax")
	@ResponseBody
	public ResponseEntity<CommentFileVO> uploadAjaxPost(MultipartFile uploadFile) {

		List<FileVO> list = new ArrayList<>();
		String uploadFolder = "C:\\zzz\\upload";
		String uploadFolderPath = UploadFileUtils.getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		// File.exists 지정한 파일이 있는지 확인
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		} // make date folder

		CommentFileVO fileVO = new CommentFileVO();
		String uploadFileName = uploadFile.getOriginalFilename();

		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
		fileVO.setFname(uploadFileName);

		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;

		try {
			File saveFile = new File(uploadPath, uploadFileName);
			uploadFile.transferTo(saveFile);

			fileVO.setUuid(uuid.toString());
			fileVO.setDatefolder(uploadFolderPath);
			
			FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
			Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 100, 100);
			thumbnail.close();
		
			service.insertFile(fileVO);
		
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<CommentFileVO>(fileVO, HttpStatus.OK);
	}

	

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		File file = new File("C:\\zzz\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		File file;

		try {
			file = new File("C:\\zzz\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
