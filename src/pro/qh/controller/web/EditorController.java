package pro.qh.controller.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller(value="/admin")
public class EditorController {

	private static final String CK_IMAGE_PATH = File.separator + "uploadImage";
	

	
	/**
	 * ckeditor5编辑器
	 * @return
	 */
	@RequestMapping(value="/editor.do")
	public String editor(){
		return "/WEB-INF/admin/editor.jsp";
	}
	
	
	
	/**
	 * 文件上传
	 * @param file
	 * @param request
	 * @return
	 */
	//@RequestMapping(value="loadImage.do")
	@ResponseBody
	public Map<String, String> updateMaterial(@RequestPart("upload") MultipartFile file, HttpServletRequest request) {
		if(file==null || "".equals(file.getOriginalFilename().trim())) {
            return generateResult(false, "#");
        }
		System.out.println("前台");
		System.out.println("文件上传");
        //获取文件名
		String fileName = file.getOriginalFilename();
		//获取文件后缀  jpg
		String lastName = fileName.substring(fileName.lastIndexOf(".")+1);
		System.out.println(fileName);
		System.out.println(lastName);
		//文件重命名,保证唯一性
		String uploadFileName = UUID.randomUUID().toString() + "." + lastName;
		System.out.println(uploadFileName);
		
		//获取文件路径
		String projectRealPath = request.getSession().getServletContext().getRealPath("");
		
		String realPath = projectRealPath + CK_IMAGE_PATH;
        File imageDir = new File(realPath);
        if(!imageDir.exists()) {
            imageDir.mkdirs();
        }

        //文件上传
        String localFilePath = realPath + File.separator + uploadFileName;
        try {
            file.transferTo(new File(localFilePath));
        } catch (IllegalStateException e) {
            e.printStackTrace();
            // log here
        } catch (IOException e) {
            e.printStackTrace();
            // log here
        }
        
        //完整路径
        String imageContextPath = request.getContextPath() + "/uploadImage" + "/" + uploadFileName;

        System.out.println("原始文件名: " + fileName);
        System.out.println("修改唯一名称: " + uploadFileName);
        System.out.println("文件路径: " + localFilePath);
        System.out.println("返回前端路径: " + imageContextPath);

        return generateResult(true, imageContextPath);	
	}
	
	
	/**
	 * ckEditor上传图片以及自定义接口返回json的格式
	 * @param uploaded
	 * @param relativeUrl
	 * @return
	 */
	@ResponseBody
	private Map<String, String> generateResult(boolean uploaded, String relativeUrl){
        Map<String, String> result = new HashMap<String, String>();
        result.put("uploaded", uploaded + "");
        result.put("url", relativeUrl);
        System.out.println("前端返回结果:" + result);
        return result;
    }

}
