package cn.hyb.service;

import java.util.List;

import cn.hyb.netpojo.ArticleCard;

public interface ArticleCardService {
	
	/**
	 * 查询出所有文章的信息，并装配在一起
	 * @return
	 */
	List<ArticleCard> selAllArticleCard();
}
