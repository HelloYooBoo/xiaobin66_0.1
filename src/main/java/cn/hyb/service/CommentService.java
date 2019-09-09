package cn.hyb.service;

import java.util.List;

import cn.hyb.netpojo.Comment;
import cn.hyb.pojo.XbComment;

public interface CommentService {
	
	/**
	 * 插入新的评论
	 * 
	 * @return  返回成功的条数
	 */
	int insComment(XbComment comment);
	
	
	/**
	 * 查询一个文章的所有评论
	 * @return 返回所有的list集合
	 */
	List<Comment> selAllComment(Integer articleId);
	
	/**
	 * 如果userId和commentId的passid不同则拒绝操作
	 * 把一个评论的ex设为0
	 * @param commentId
	 * @param userId
	 * @return 
	 */
	int delComment(Integer commentId,Integer userId);
	
}
