package org.mvc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.mvc.domain.FileVO;
import org.mvc.util.UploadFileUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class FileController {
	
	@PostMapping("/uploadAjax")
	@ResponseBody
	public ResponseEntity<List<FileVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<FileVO> list = new ArrayList<>();
		String uploadFolder = "C:\\zzz\\upload";
		String uploadFolderPath = UploadFileUtils.getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		//File.exists 지정한 파일이 있는지 확인
		if(uploadPath.exists() == false) {
		uploadPath.mkdirs();
		}// make date folder
		
		for(MultipartFile multipartFile : uploadFile) {
			FileVO fileVO = new FileVO();
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			fileVO.setFname(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() +"_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				fileVO.setAddress(saveFile.toString());
				
				if(UploadFileUtils.checkImageType(saveFile)) {
					fileVO.setImage("y");
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100,100);
					thumbnail.close();
				}
				list.add(fileVO);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
}
