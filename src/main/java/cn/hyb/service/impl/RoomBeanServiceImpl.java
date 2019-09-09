package cn.hyb.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hyb.mapper.XbCommentAgreeMapper;
import cn.hyb.mapper.XbCommentMapper;
import cn.hyb.mapper.XbHeadiconMapper;
import cn.hyb.mapper.XbUserInfoMapper;
import cn.hyb.netpojo.ArticleCard;
import cn.hyb.netpojo.Comment;
import cn.hyb.netpojo.RoomBean;
import cn.hyb.netpojo.User;
import cn.hyb.pojo.XbComment;
import cn.hyb.pojo.XbCommentAgreeExample;
import cn.hyb.pojo.XbHeadicon;
import cn.hyb.pojo.XbUser;
import cn.hyb.pojo.XbUserInfo;
import cn.hyb.service.LoginService;
import cn.hyb.service.ReadService;
import cn.hyb.service.RoomBeanService;
@Service
public class RoomBeanServiceImpl implements RoomBeanService {
	
	@Resource
	private ReadService readServiceImpl;
	@Resource
	private XbCommentMapper xbCommentMapper;
	@Resource
	private LoginService loginServiceImpl;
	@Resource
	private XbCommentAgreeMapper xbCommentAgreeMapper;
	@Resource
	private XbUserInfoMapper xbUserInfoMapper;
	@Resource
	private XbHeadiconMapper xbHeadiconMapper;

	@Override
	public RoomBean assembleRoomBean(User user) {
		RoomBean roomBean = new RoomBean();
		XbUser xbuser = new XbUser();
		xbuser.setPassword(user.getPassword());
		xbuser.setUsername(user.getUsername());
		User selUserInfo = loginServiceImpl.selUserInfo(xbuser);
		
		roomBean.setUserBean(selUserInfo);
		roomBean.getUserBean().setRoleId(null);
		try {
			List<Integer> articleCollectId = selUserInfo.getArticleCollectId();
			List<ArticleCard> CollectList = new ArrayList<ArticleCard>();
			for (Integer integer : articleCollectId) {
				ArticleCard selOneById = readServiceImpl.selOneById(integer);
				if (selOneById != null) {
					selOneById.setArticlebody("");
					CollectList.add(selOneById);
				}
			}
			roomBean.setArticleCollectId(CollectList);
		} catch (Exception e) {
			System.out.println("装配ArticleCollect出错");
		}
		try {
			List<Integer> articleVisitId = selUserInfo.getArticleVisitId();
			List<ArticleCard> VisitList = new ArrayList<ArticleCard>();
			for (Integer integer : articleVisitId) {
				ArticleCard selOneById = readServiceImpl.selOneById(integer);
				if (selOneById != null) {
					selOneById.setArticlebody("");
					VisitList.add(selOneById);
				}
			}
			roomBean.setArticleVisitId(VisitList);
		} catch (Exception e) {
			System.out.println("装配articleVisit出错");
		}
		try {
			List<Integer> MyArticleId = selUserInfo.getMyArticleId();
			List<ArticleCard> myList = new ArrayList<ArticleCard>();
			for (Integer integer : MyArticleId) {
				ArticleCard selOneById = readServiceImpl.selOneById(integer);
				if (selOneById != null) {
					selOneById.setArticlebody("");
					myList.add(selOneById);
				}
			}
			roomBean.setMyArticleId(myList);
		} catch (Exception e) {
			System.out.println("装配MyArticle出错");
		}
		
		
		try {
			List<Integer> commentId = selUserInfo.getMessageId();
			List<Comment> commentList = new ArrayList<>();
			for (Integer integer : commentId) {
				XbComment xbcomment = xbCommentMapper.selectByPrimaryKey(integer);
				Comment comment=new Comment();
				XbCommentAgreeExample xbCommentAgreeExample = new XbCommentAgreeExample();
				xbCommentAgreeExample.createCriteria().andCommentIdEqualTo(xbcomment.getId());
				comment.setAgreeNumber(xbCommentAgreeMapper.countByExample(xbCommentAgreeExample));
				comment.setArticleId(xbcomment.getArticleId());
				comment.setCommentId(xbcomment.getCommentId());
				comment.setEx(xbcomment.getEx());
				comment.setId(xbcomment.getId());
				comment.setParentId(xbcomment.getParentId());
				
				XbUserInfo cmyUserInfo = xbUserInfoMapper.selectByPrimaryKey(xbcomment.getPasserId());
				comment.setPasserName(cmyUserInfo.getNickname());
				//未设置头像
				if(cmyUserInfo.getHeadiconId()!=null) {
					XbHeadicon cheadpic = xbHeadiconMapper.selectByPrimaryKey(cmyUserInfo.getHeadiconId());
					//设置了头像但是头像被删
					if(cheadpic!=null) {
						comment.setPasserHeadpic(cheadpic.getUrl());
					}
				}
				comment.setPasserId(xbcomment.getPasserId());
				comment.setSendtime(xbcomment.getSendtime());
				comment.setWords(xbcomment.getWords());
				if (comment != null) {
					commentList.add(comment);
				}
			}
			Collections.sort(commentList); // 按发送时间降序-》最新的排最上面
			roomBean.setMessageId(commentList);
		} catch (Exception e) {
			System.out.println("装配评论出错");
		}
		return roomBean;
	}

}






