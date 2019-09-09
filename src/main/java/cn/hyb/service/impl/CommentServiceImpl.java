package cn.hyb.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hyb.mapper.XbArticleMapper;
import cn.hyb.mapper.XbCommentAgreeMapper;
import cn.hyb.mapper.XbCommentMapper;
import cn.hyb.mapper.XbHeadiconMapper;
import cn.hyb.mapper.XbUserInfoMapper;
import cn.hyb.netpojo.Comment;
import cn.hyb.pojo.XbArticle;
import cn.hyb.pojo.XbComment;
import cn.hyb.pojo.XbCommentAgreeExample;
import cn.hyb.pojo.XbCommentExample;
import cn.hyb.pojo.XbHeadicon;
import cn.hyb.pojo.XbUserInfo;
import cn.hyb.service.CommentService;
@Service
public class CommentServiceImpl implements CommentService {

	@Resource
	private XbCommentMapper xbCommentMapper;
	@Resource
	private XbUserInfoMapper xbUserInfoMapper ;
	@Resource
	private XbArticleMapper xbArticleMapper ;
	@Resource
	private XbHeadiconMapper xbHeadiconMapper ;
	@Resource
	private XbCommentAgreeMapper xbCommentAgreeMapper;
	
	@Override
	public int insComment(XbComment comment) {
		int index = xbCommentMapper.insertSelective(comment);
		return index;
	}

	@Override
	public List<Comment> selAllComment(Integer articleId) {
		XbArticle article = xbArticleMapper.selectByPrimaryKey(articleId);
		//没查到对应的文章
		if(article==null) {
			return null;
		}
		//根据articleId获取他的所有评论
		XbCommentExample commentExample = new XbCommentExample();
		commentExample.createCriteria().andArticleIdEqualTo(articleId).andParentIdEqualTo(0).andExEqualTo(1);
		List<XbComment> comments = xbCommentMapper.selectByExampleWithBLOBs(commentExample);
		List<Comment> clist=new ArrayList<Comment>();
		for (XbComment xbComment : comments) {
			//基本信息装配
			Comment comment=new Comment();
			comment.setArticleId(xbComment.getArticleId());
			comment.setCommentId(xbComment.getCommentId());
			//根据CommentId获得被评论人的昵称和id
			if(xbComment.getCommentId()!=0) {
				Integer othersUserId = xbCommentMapper.selectByPrimaryKey(xbComment.getCommentId()).getPasserId();
				XbUserInfo othersUserInfo = xbUserInfoMapper.selectByPrimaryKey(othersUserId);
				comment.setRespondentId(othersUserId);
				comment.setRespondentName(othersUserInfo.getNickname());
			}
			comment.setEx(xbComment.getEx());
			comment.setId(xbComment.getId());
			comment.setParentId(xbComment.getParentId());
			comment.setPasserId(xbComment.getPasserId());
			XbUserInfo myUserInfo = xbUserInfoMapper.selectByPrimaryKey(xbComment.getPasserId());
			comment.setPasserName(myUserInfo.getNickname());
			comment.setSendtime(xbComment.getSendtime());
			//未设置头像
			if(myUserInfo.getHeadiconId()!=null) {
				XbHeadicon headpic = xbHeadiconMapper.selectByPrimaryKey(myUserInfo.getHeadiconId());
				//设置了头像但是头像被删
				if(headpic!=null) {
					comment.setPasserHeadpic(headpic.getUrl());
				}
			}
			comment.setWords(xbComment.getWords());
			//外联信息装配
			XbCommentExample commentExample2 = new XbCommentExample();
			commentExample2.createCriteria().andArticleIdEqualTo(articleId).andParentIdEqualTo(xbComment.getId()).andExEqualTo(1);
			List<XbComment> comments2 = xbCommentMapper.selectByExampleWithBLOBs(commentExample2);
			List<Comment> clist2s=new ArrayList<Comment>();
			for (XbComment xbComment2 : comments2) {
				Comment comment2=new Comment();
				comment2.setArticleId(xbComment2.getArticleId());
				comment2.setCommentId(xbComment2.getCommentId());
				//根据CommentId获得被评论人的昵称和id
				Integer cothersUserId = xbCommentMapper.selectByPrimaryKey(xbComment2.getCommentId()).getPasserId();
				XbUserInfo cothersUserInfo = xbUserInfoMapper.selectByPrimaryKey(cothersUserId);
				comment2.setRespondentId(cothersUserId);
				comment2.setRespondentName(cothersUserInfo.getNickname());
				comment2.setEx(xbComment2.getEx());
				comment2.setId(xbComment2.getId());
				comment2.setParentId(xbComment2.getParentId());
				comment2.setPasserId(xbComment2.getPasserId());
				XbUserInfo cmyUserInfo = xbUserInfoMapper.selectByPrimaryKey(xbComment2.getPasserId());
				comment2.setPasserName(cmyUserInfo.getNickname());
				//未设置头像
				if(cmyUserInfo.getHeadiconId()!=null) {
					XbHeadicon cheadpic = xbHeadiconMapper.selectByPrimaryKey(cmyUserInfo.getHeadiconId());
					//设置了头像但是头像被删
					if(cheadpic!=null) {
						comment2.setPasserHeadpic(cheadpic.getUrl());
					}
				}
				comment2.setSendtime(xbComment2.getSendtime());
				comment2.setWords(xbComment2.getWords());
				//外联信息装配
				XbCommentAgreeExample xbCommentAgreeExample = new XbCommentAgreeExample();
				xbCommentAgreeExample.createCriteria().andCommentIdEqualTo(xbComment2.getId());
				comment2.setAgreeNumber(xbCommentAgreeMapper.countByExample(xbCommentAgreeExample));
				clist2s.add(comment2);
			}
			comment.setChildren(clist2s);
			XbCommentAgreeExample xbCommentAgreeExample = new XbCommentAgreeExample();
			xbCommentAgreeExample.createCriteria().andCommentIdEqualTo(xbComment.getId());
			comment.setAgreeNumber(xbCommentAgreeMapper.countByExample(xbCommentAgreeExample));
			clist.add(comment);
		}
		return clist;
	}

	@Override
	public int delComment(Integer commentId, Integer userId) {
		System.out.println(commentId+":"+userId);
		//删除父级评论：
		XbComment selectByPrimaryKey = xbCommentMapper.selectByPrimaryKey(commentId);
		if(selectByPrimaryKey.getPasserId()!=userId) {
			return 0;
		}
		selectByPrimaryKey.setEx(0);
		int index = xbCommentMapper.updateByPrimaryKeySelective(selectByPrimaryKey);
		//删除子级评论
		try {
			XbCommentExample example = new XbCommentExample();
			example.createCriteria().andParentIdEqualTo(commentId);
			List<XbComment> selectByExample = xbCommentMapper.selectByExample(example);
			if(selectByExample.size()>0) {
				for (XbComment xbComment : selectByExample) {
					xbComment.setEx(0);
					xbCommentMapper.updateByPrimaryKeySelective(xbComment);
				}
			}
		} catch (Exception e) {
			System.out.println("删除子级评论,错误");
		}			
		
		if(index>0) {
			System.out.println("被删评论："+selectByPrimaryKey.getWords());
		}
		return index;
	}

}








