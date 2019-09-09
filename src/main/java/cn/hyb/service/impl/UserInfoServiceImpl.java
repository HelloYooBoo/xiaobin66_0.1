package cn.hyb.service.impl;

import java.io.IOException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.hyb.mapper.XbArticlePictureMapper;
import cn.hyb.mapper.XbHeadiconMapper;
import cn.hyb.mapper.XbUserInfoMapper;
import cn.hyb.mapper.XbUserMapper;
import cn.hyb.netpojo.User;
import cn.hyb.pojo.XbArticlePicture;
import cn.hyb.pojo.XbHeadicon;
import cn.hyb.pojo.XbHeadiconExample;
import cn.hyb.pojo.XbUser;
import cn.hyb.pojo.XbUserInfo;
import cn.hyb.service.UserInfoService;
import cn.hyb.utils.FileUtil;
import cn.hyb.utils.FtpUtil;
@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	@Resource
	private XbHeadiconMapper xbHeadiconMapper;
	@Resource
	private XbArticlePictureMapper xbArticlePictureMapper;
	@Resource
	private XbUserInfoMapper xbUserInfoMapper;
	@Resource
	private XbUserMapper xbUserMapper;
	
	@Value("${ftpclient.host}")
	private String host;
	@Value("${ftpclient.port}")
	private int port;
	@Value("${ftpclient.username}")
	private String username;
	@Value("${ftpclient.password}")
	private String password;
	@Value("${ftpclient.basepath}")
	private String basePath;
	@Value("${ftpclient.filepath}")
	private String filePath;
	@Value("${ftpclient.urlhome}")
	private String urlhome;
	@Value("${ftpclient.imgurl}")
	private String imgurl;
	@Value("${ftpclient.path}")
	private String path;
	@Override
	public String uplord(MultipartFile file,User user) throws IOException {
		String fileEndName=null;
		try {
			fileEndName=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		} catch (Exception e) {
			return null;
		}
		if(fileEndName==null||!(".jpg".equals(fileEndName)||".png".equals(fileEndName)||".gif".equals(fileEndName))) {
			System.out.println("头像格式不对");
			return null;
		}
		String filename = UUID.randomUUID()+fileEndName;
		try {
			boolean flag = FileUtil.approvalFile(file.getInputStream(), filename, path);
			if(!flag) {
				System.out.println("图片存储失败");
				return null;
			}
		} catch (Exception e) {
			return null;
		}
		XbHeadicon headpic=new XbHeadicon();
		headpic.setUrl(imgurl+filename);
		int index = xbHeadiconMapper.insertSelective(headpic);
		user.setHeadpic(headpic.getUrl());
		XbUserInfo userInfo = getUserInfo(user);
		XbHeadiconExample example=new XbHeadiconExample();
		example.createCriteria().andUrlEqualTo(headpic.getUrl());
		List<XbHeadicon> selectByExample = xbHeadiconMapper.selectByExample(example);
		if(selectByExample==null) {
			System.out.println("头像插入出错");
			return null;
		}
		userInfo.setHeadiconId(selectByExample.get(0).getId());
		int insertSelective = xbUserInfoMapper.updateByPrimaryKeySelective(userInfo);
		if(index>0&&insertSelective>0) {
			return headpic.getUrl();
		}else {
			return null;
		}
	}
	/**
	 * 根据Userbean获取userinfo若不存在则新建一个userinfo
	 * @param user
	 * @return
	 */
	@Override
	public XbUserInfo getUserInfo(User user) {
		XbUserInfo bUserInfo = xbUserInfoMapper.selectByPrimaryKey(user.getId());
		if(bUserInfo==null) {
			XbUserInfo nUserInfo=new XbUserInfo();
			nUserInfo.setId(user.getId());
			xbUserInfoMapper.insertSelective(nUserInfo);
			return nUserInfo;
		}else {
			return bUserInfo;
		}
	}

	@Override
	public int updPassword(String password, User user) {
		XbUser xbuser=new XbUser();
		xbuser.setId(user.getId());
		xbuser.setPassword(password);
		int index = xbUserMapper.updateByPrimaryKeySelective(xbuser);
		user.setPassword(password);
		return index;
	}

	@Override
	public int updNickname(String nickname, User user) {
		XbUserInfo userInfo = getUserInfo(user);
		userInfo.setNickname(nickname);
		user.setNickname(nickname);
		int index = xbUserInfoMapper.updateByPrimaryKeySelective(userInfo);
		return index;
	}

	@Override
	public int updBirthday(String birthday, User user) {
		XbUserInfo userInfo = getUserInfo(user);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(birthday, pos);
		userInfo.setBirthday(strtodate);
		user.setBirthday(strtodate);
		int index = xbUserInfoMapper.updateByPrimaryKeySelective(userInfo);
		return index;
	}

	
	
	@Override
	public int updEmail(String email, User user) {
		
	   if (!validateEmail(email)) {
		   System.out.println("邮箱不合法");
		   return 0;
	   }
	   System.out.println("邮箱合法");
		XbUserInfo userInfo = getUserInfo(user);
		userInfo.seteMail(email);
		user.seteMail(email);
		int index = xbUserInfoMapper.updateByPrimaryKeySelective(userInfo);
		return index;
	}

	@Override
	public int updIntroduction(String introduction, User user) {
		XbUserInfo userInfo = getUserInfo(user);
		userInfo.setIntroduction(introduction);
		user.setIntroduction(introduction);
		int index = xbUserInfoMapper.updateByPrimaryKeyWithBLOBs(userInfo);
		return index;
	}

	/**
	 * 邮箱验证
	 * @param email
	 * @return
	 */
	public static boolean validateEmail(String email) {
		int pos = email.indexOf("@");
		if (pos == -1 || pos == 0 || pos == email.length() - 1) {
		return false;
		}
		String[] strings = email.split("@");
		if (strings.length != 2) {// 如果邮箱不是xxx@xxx格式
		return false;
		}
		CharSequence cs = strings[0];
		for (int i = 0; i < cs.length(); i++) {
		char c = cs.charAt(i);
		if (!Character.isLetter(c) && !Character.isDigit(c)) {
		return false;
		}
		}
		pos = strings[1].indexOf(".");// 如果@后面没有.，则是错误的邮箱。
		if (pos == -1 || pos == 0 || pos == email.length() - 1) {
		return false;
		}
		strings = strings[1].split(".");
		for (int j = 0; j < strings.length; j++) {
		cs = strings[j];
		if (cs.length() == 0) {
		return false;
		}
		for (int i = 0; i < cs.length(); i++) {//如果保护不规则的字符，表示错误
		char c = cs.charAt(i);
		if (!Character.isLetter(c) && !Character.isDigit(c)) {
		return false;
		}
		}
		}
		return true;
		}
	@Override
	public String insArticlePic(MultipartFile file) throws IOException {
		String fileEndName=null;
		try {
			fileEndName=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		} catch (Exception e) {
			return null;
		}
		if(fileEndName==null||!(".jpg".equals(fileEndName)||".jpeg".equals(fileEndName)||".png".equals(fileEndName)||".gif".equals(fileEndName))) {
			System.out.println("图片格式不对");
			return null;
		}
		String filename = UUID.randomUUID()+fileEndName;
		try {
			boolean flag = FileUtil.approvalFile(file.getInputStream(), filename, path);
			if(!flag) {
				System.out.println("图片存储失败");
				return null;
			}
//			FtpUtil.uploadFile(host, port, username, password, basePath, filePath, filename, file.getInputStream());
		} catch (Exception e) {
			return null;
		}
		XbArticlePicture articlePicture = new XbArticlePicture();
		articlePicture.setUrl(imgurl+filename);
		int index = xbArticlePictureMapper.insertSelective(articlePicture);
		if(index>0) {
			return articlePicture.getUrl();
		}else {
			return null;
		}
	}
//	@Override
//	public String insArticlePic(MultipartFile file) throws IOException {
//		String fileEndName=null;
//		try {
//			fileEndName=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
//		} catch (Exception e) {
//			return null;
//		}
//		if(fileEndName==null||!(".jpg".equals(fileEndName)||".png".equals(fileEndName)||".gif".equals(fileEndName))) {
//			System.out.println("图片格式不对");
//			return null;
//		}
//		String filename = UUID.randomUUID()+fileEndName;
//		try {
//			FtpUtil.uploadFile(host, port, username, password, basePath, filePath, filename, file.getInputStream());
//		} catch (Exception e) {
//			return null;
//		}
//		XbArticlePicture articlePicture = new XbArticlePicture();
//		articlePicture.setUrl(urlhome+filename);
//		int index = xbArticlePictureMapper.insertSelective(articlePicture);
//		if(index>0) {
//			return articlePicture.getUrl();
//		}else {
//			return null;
//		}
//	}
}
