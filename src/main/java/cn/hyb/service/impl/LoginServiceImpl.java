package cn.hyb.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hyb.mapper.XbArticleCollectMapper;
import cn.hyb.mapper.XbArticleMapper;
import cn.hyb.mapper.XbArticleVisitMapper;
import cn.hyb.mapper.XbCommentMapper;
import cn.hyb.mapper.XbHeadiconMapper;
import cn.hyb.mapper.XbIdolFansMapper;
import cn.hyb.mapper.XbUserInfoMapper;
import cn.hyb.mapper.XbUserMapper;
import cn.hyb.netpojo.User;
import cn.hyb.pojo.XbArticle;
import cn.hyb.pojo.XbArticleCollect;
import cn.hyb.pojo.XbArticleCollectExample;
import cn.hyb.pojo.XbArticleExample;
import cn.hyb.pojo.XbArticleVisit;
import cn.hyb.pojo.XbArticleVisitExample;
import cn.hyb.pojo.XbComment;
import cn.hyb.pojo.XbCommentExample;
import cn.hyb.pojo.XbHeadicon;
import cn.hyb.pojo.XbIdolFans;
import cn.hyb.pojo.XbIdolFansExample;
import cn.hyb.pojo.XbUser;
import cn.hyb.pojo.XbUserExample;
import cn.hyb.pojo.XbUserInfo;
import cn.hyb.pojo.XbUserInfoExample;
import cn.hyb.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Resource
	private XbUserMapper xbUserMapper;
	@Resource
	private XbUserInfoMapper xbUserInfoMapper;
	@Resource
	private XbIdolFansMapper xbIdolFansMapper;
	@Resource
	private XbArticleVisitMapper xbArticleVisitMapper;
	@Resource
	private XbArticleCollectMapper xbArticleCollectMapper;
	@Resource
	private XbArticleMapper xbArticleMapper;
	@Resource
	private XbCommentMapper xbCommentMapper;
	@Resource
	private XbHeadiconMapper xbHeadiconMapper;
	
	
	@Override
	public int selUserForLogin(XbUser user) {
		
		if(user.getPassword()!=null&&user.getUsername()!=null) {
			XbUserExample example = new XbUserExample();
			example.createCriteria().andUsernameEqualTo(user.getUsername()).andPasswordEqualTo(user.getPassword());
			List<XbUser> userlist = xbUserMapper.selectByExample(example);
			if(userlist!=null) {
				return userlist.size();
			}
		}
		return 0;
	}

	@Override
	public User selUserInfo(XbUser user) {
		XbUserExample example = new XbUserExample();
		example.createCriteria().andUsernameEqualTo(user.getUsername()).andPasswordEqualTo(user.getPassword());
		List<XbUser> userlist = xbUserMapper.selectByExample(example);
		if(userlist==null||userlist.size()==0) {
			return null;
		}
		User userBean = new User();
		//装配关键信息(权限&登录)
		try {
			userBean.setId(userlist.get(0).getId());
			userBean.setUsername(userlist.get(0).getUsername());
			userBean.setPassword(userlist.get(0).getPassword());
			userBean.setRoleId(userlist.get(0).getRoleId());
		} catch (Exception e) {
			System.out.println("装配关键信息(权限&登录):失败");
		}
		
		XbUserInfo userInfo = xbUserInfoMapper.selectByPrimaryKey(userlist.get(0).getId());
		if (userInfo!= null) {
			//装配基本信息
			try {
				userBean.setNickname(userInfo.getNickname());
				userBean.setRegdate(userInfo.getRegdate());
				userBean.setBirthday(userInfo.getBirthday());
				userBean.seteMail(userInfo.geteMail());
				XbHeadicon xbHeadicon = xbHeadiconMapper.selectByPrimaryKey(userInfo.getHeadiconId());
				if(xbHeadicon!=null) {
					userBean.setHeadpic(xbHeadicon.getUrl());
				}
				userBean.setIntroduction(userInfo.getIntroduction());
			} catch (Exception e) {
				System.out.println("装配基本信息:失败");
			}
		}
		
		//装配外联信息
		try {
			//获取我的关注
			XbIdolFansExample fansExample = new XbIdolFansExample();
			fansExample.createCriteria().andFansIdEqualTo(userBean.getId());
			List<XbIdolFans> selectByExample = xbIdolFansMapper.selectByExample(fansExample);
			//获取我的粉丝
			XbIdolFansExample idolExample = new XbIdolFansExample();
			idolExample.createCriteria().andIdolIdEqualTo(userBean.getId());
			List<XbIdolFans> selectByExample2 = xbIdolFansMapper.selectByExample(idolExample);
			//业务装配
			List<XbUserInfo> myidolList = new ArrayList<XbUserInfo>();
			List<XbUserInfo> fansList = new ArrayList<XbUserInfo>();
			for (XbIdolFans myfav : selectByExample) {
				XbUserInfo favInfo = xbUserInfoMapper.selectByPrimaryKey(myfav.getFansId());
				if (favInfo != null) {
					myidolList.add(favInfo);
				}
			}
			for (XbIdolFans myfans : selectByExample2) {
				XbUserInfo fansInfo = xbUserInfoMapper.selectByPrimaryKey(myfans.getFansId());
				if (fansInfo != null) {
					myidolList.add(fansInfo);
				}
			}
			userBean.setMyidol(myidolList);
			userBean.setFans(fansList);
		} catch (Exception e) {
			System.out.println("装配关注和粉丝出错！");
		}
		
		try {
			XbArticleVisitExample articleVisitExample = new XbArticleVisitExample();
			articleVisitExample.createCriteria().andUserIdEqualTo(userBean.getId());
			List<XbArticleVisit> selectByExample = xbArticleVisitMapper.selectByExample(articleVisitExample);
			List<Integer> articleVisitIdList = new ArrayList<>();
			for (XbArticleVisit xbArticleVisit : selectByExample) {
				if(!articleVisitIdList.contains(xbArticleVisit.getArticleId())) {
					articleVisitIdList.add(xbArticleVisit.getArticleId());
				}
			}
			userBean.setArticleVisitId(articleVisitIdList);
		} catch (Exception e) {
			System.out.println("装配我的浏览出错！");
		}
		
		try {
			XbArticleCollectExample articleCollectExample = new XbArticleCollectExample();
			articleCollectExample.createCriteria().andUserIdEqualTo(userBean.getId());
			List<XbArticleCollect> selectByExample = xbArticleCollectMapper.selectByExample(articleCollectExample);
			List<Integer> articleCollectIdList = new ArrayList<>();
			for (XbArticleCollect xbArticleCollect : selectByExample) {
				if (!articleCollectIdList.contains(xbArticleCollect.getArticleId())) {
					articleCollectIdList.add(xbArticleCollect.getArticleId());
				}
			}
			userBean.setArticleCollectId(articleCollectIdList);
		} catch (Exception e) {
			System.out.println("装配我的收藏出错！");
		}
		
		try {
			XbArticleExample articleExample = new XbArticleExample();
			articleExample.createCriteria().andAuthorIdEqualTo(userBean.getId());
			List<XbArticle> selectByExample = xbArticleMapper.selectByExample(articleExample);
			List<Integer> myArticleIdList = new ArrayList<>();
			for (XbArticle xbArticle : selectByExample) {
				if (!myArticleIdList.contains(xbArticle.getId())) {
					myArticleIdList.add(xbArticle.getId());
				}
			}
			userBean.setMyArticleId(myArticleIdList);
		} catch (Exception e) {
			System.out.println("装配我的作品出错！");
		}
		
		
		//先查出我的所有评论
		//遍历我评论的id，看有没有人回复过(commentid&parentid)我这条评论，将这些评论加入list
		//遍历我的所有文章
		try {
			XbCommentExample commentExample = new XbCommentExample();
			commentExample.createCriteria().andPasserIdEqualTo(userBean.getId()).andExEqualTo(1);
			List<XbComment> selectByExample = xbCommentMapper.selectByExample(commentExample);
			List<Integer> messageIdList = new ArrayList<>();
			for (XbComment xbComment : selectByExample) {
				//我评论被回复
				commentExample.clear();
				commentExample.createCriteria().andCommentIdEqualTo(xbComment.getId()).andExEqualTo(1);
				List<XbComment> s = xbCommentMapper.selectByExample(commentExample);
				for (XbComment xbComment2 : s) {
					if (!messageIdList.contains(xbComment2.getId())) {
						messageIdList.add(xbComment2.getId());
					}
				}
				//我主评论下的其他回复
				commentExample.clear();
				commentExample.createCriteria().andParentIdEqualTo(xbComment.getId()).andExEqualTo(1);
				List<XbComment> s2 = xbCommentMapper.selectByExample(commentExample);
				for (XbComment xbComment2 : s2) {
					if (!messageIdList.contains(xbComment2.getId())) {
						messageIdList.add(xbComment2.getId());
					}
				}
			}
			for (Integer integer : userBean.getMyArticleId()) {
				commentExample.clear();
				commentExample.createCriteria().andArticleIdEqualTo(integer).andExEqualTo(1);
				List<XbComment> s3 = xbCommentMapper.selectByExample(commentExample);
				for (XbComment xbComment2 : s3) {
					if (!messageIdList.contains(xbComment2.getId())) {
						messageIdList.add(xbComment2.getId());
					}
				}
			}
			userBean.setMessageId(messageIdList);
		} catch (Exception e) {
			System.out.println("装填我的收到的回复出错");
		}
		return userBean;
	}
}
