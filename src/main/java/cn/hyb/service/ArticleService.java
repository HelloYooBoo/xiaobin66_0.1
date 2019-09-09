package cn.hyb.service;

import java.util.List;

import cn.hyb.pojo.XbArticle;
import cn.hyb.pojo.XbArticlePicture;

public interface ArticleService {
	/**
	 * 查出所有文章
	 * @return
	 */
	List<XbArticle> selAll();
	
	/**
	 * 隐藏
	 * @param id
	 * @return
	 */
	int hide(int id);
	
	/**
	 * 新增
	 * @param id
	 * @return
	 */
	int insert(XbArticle article);
	
	/**
	 * 修改
	 * @param id
	 * @return
	 */
	int alter(XbArticle article);
	
	/**
	 * 查询一个文章
	 * @return
	 */
	XbArticle selOne(int id) ;
}
