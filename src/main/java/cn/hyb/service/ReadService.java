package cn.hyb.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import cn.hyb.netpojo.ArticleCard;
import cn.hyb.pojo.XbArticle;

public interface ReadService {
	
	/**
	 * 根据文章id获取文章具体信息
	 * @param articleId
	 * @return
	 */
	ArticleCard selOneById(int articleId);
	
	/**
	 * 侧边栏文章查询最新
	 * @return
	 */
	List<XbArticle> selNewest();
	
	/**
	 * 侧边栏文章查询最热
	 * @return
	 */
	List<XbArticle> selHotest();
	
	/**
	 * 浏览记录
	 * 一个人可以多次浏览同一个文章，所以可以重复记录
	 * 只要请求一次read/xx就记录一次
	 * @param articleId
	 * @return 0为添加失败，1为成功
	 */
	int updVisit(int articleId,int visiterId);
	
	/**
	 * 点赞：当用户在/页点赞或read页点赞时，增加记录
	 * 一个人只能点赞一次
	 * 先查询不重复再新增!!importent!!
	 * @param articleId
	 * @param visiterId
	 * @return 0为添加失败，1为成功
	 */
	int updAgreeForArticle(int articleId,int visiterId);
	
	/**
	 * 点赞：当用户在文章页点赞或room页点赞评论时，增加记录
	 * 一个人只能点赞一次
	 * 先查询不重复再新增!!importent!!
	 * @param articleId
	 * @param visiterId
	 * @return 0为添加失败，1为成功
	 */
	int updAgreeForComment(int commentId,int visiterId);
	
	/**
	 * 收藏：当用户在/页收藏或read页收藏时，增加记录
	 * 一个人只能收藏一次
	 * 先查询存在则删除，不存在则新增
	 * 可以再次点击取消收藏
	 * 是否收藏标出满星或空星
	 * @param articleId
	 * @param visiterId
	 * @return 0为添加失败，1为新增收藏成功，2为取消(删除)收藏成功
	 */
	int updCollect(int articleId,int visiterId);
	
	/**
	 * 查询是否收藏
	 * @param articleId
	 * @param visiterId
	 * @return 0未收藏 1收藏
	 */
	int selIsCollect(int articleId,int visiterId);
	
	/**
	 * 查询用户所有点赞过的评论id
	 * @param visiterId
	 * @return 评论id的list
	 */
	List<Integer> selIsAgreeForComment(int visiterId);
	
	/**
	 * 查询用户所有点赞过的文章id 主页，文章页使用
	 * @param visiterId
	 * @return
	 */
	List<Integer> selIsAgreeForArticle(Integer articleId,int visiterId);
}
