package cn.hyb.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hyb.mapper.XbArticleLastAltertimeMapper;
import cn.hyb.mapper.XbArticleMapper;
import cn.hyb.pojo.XbArticle;
import cn.hyb.pojo.XbArticleExample;
import cn.hyb.pojo.XbArticleLastAltertime;
import cn.hyb.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService{
	@Resource
	private XbArticleMapper xbArticleMapper;
	@Resource
	private XbArticleLastAltertimeMapper xbArticleLastAltertimeMapper;

	@Override
	public List<XbArticle> selAll() {
		
		List<XbArticle> list = xbArticleMapper.selectByExample(null);
		return list;
	}

	@Override
	public int hide(int id) {
		XbArticleExample articleExample = new XbArticleExample();
		articleExample.createCriteria().andIdEqualTo(id);
		XbArticle article=new XbArticle();
		article.setEx(0);
		int index = xbArticleMapper.updateByExampleSelective(article, articleExample);
		
		return index;
	}

	@Override
	public int insert(XbArticle article) {
		article.setUploadtime(new Date());
		article.setAuthorId(1);
		int index = xbArticleMapper.insertSelective(article);
		return index;
	}

	@Override
	public int alter(XbArticle article) {
		int index = xbArticleMapper.updateByPrimaryKeySelective(article);
		XbArticleLastAltertime altertime = new XbArticleLastAltertime();
		altertime.setArticleId(article.getId());
		altertime.setLastAltertime(new Date());
		xbArticleLastAltertimeMapper.insertSelective(altertime);
		System.out.println("插入最后编辑时间："+altertime);
		return index;
	}

	@Override
	public XbArticle selOne(int id) {
		XbArticle one = xbArticleMapper.selectByPrimaryKey(id);
		return one;
	}

}
