package cn.hyb.service;

import java.io.IOException;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import cn.hyb.netpojo.User;
import cn.hyb.pojo.XbUserInfo;

public interface UserInfoService {
	/**
	 * 上传头像并返回头像Url
	 * @param file
	 * @return
	 * @throws IOException
	 */
	public String uplord(MultipartFile file,User user) throws IOException ;
	
	/**
	 * 上传头像并返回头像Url
	 * @param file
	 * @return
	 * @throws IOException
	 */
	public String insArticlePic(MultipartFile file) throws IOException ;
	
	/**
	 * 根据Userbean获取userinfo若不存在则新建一个userinfo
	 * @param user
	 * @return
	 */
	public XbUserInfo getUserInfo(User user) ;
	
	/**
	 * 根据user修改密码
	 * @param password
	 * @param user
	 * @return
	 */
	public int updPassword(String password,User user);
	
	/**
	 * 修改昵称
	 * @param nickname
	 * @param user
	 * @return
	 */
	public int updNickname(String nickname,User user);

	/**
	 * 修改生日
	 * @param birthday
	 * @param user
	 * @return
	 */
	public int updBirthday(String birthday,User user);
	
	/**
	 * 修改邮箱
	 * @param email
	 * @param user
	 * @return
	 */
	public int updEmail(String email,User user);
	
	/**
	 * 修改简介
	 * @param introduction
	 * @param user
	 * @return
	 */
	public int updIntroduction(String introduction,User user);
	
}
