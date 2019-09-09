package cn.hyb.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import cn.hyb.mapper.XbArticleAgreeMapper;
import cn.hyb.mapper.XbArticleCollectMapper;
import cn.hyb.mapper.XbArticleLastAltertimeMapper;
import cn.hyb.mapper.XbArticleMapper;
import cn.hyb.mapper.XbArticleVisitMapper;
import cn.hyb.mapper.XbCommentMapper;
import cn.hyb.mapper.XbUserInfoMapper;
import cn.hyb.mapper.XbUserMapper;
import cn.hyb.netpojo.ArticleCard;
import cn.hyb.pojo.XbArticle;
import cn.hyb.pojo.XbArticleAgreeExample;
import cn.hyb.pojo.XbArticleCollectExample;
import cn.hyb.pojo.XbArticleLastAltertime;
import cn.hyb.pojo.XbArticleLastAltertimeExample;
import cn.hyb.pojo.XbArticleVisitExample;
import cn.hyb.pojo.XbCommentExample;
import cn.hyb.service.ArticleCardService;

@Service
public class ArticleCardServiceImpl implements ArticleCardService {

	@Resource
	private XbUserMapper xbUserMapper;
	@Resource
	private XbUserInfoMapper xbUserInfoMapper;
	@Resource
	private XbArticleMapper xbArticleMapper;
	@Resource
	private XbArticleAgreeMapper xbArticleAgreeMapper;
	@Resource
	private XbArticleCollectMapper xbArticleCollectMapper;
	@Resource
	private XbArticleLastAltertimeMapper xbArticleLastAltertimeMapper;
	@Resource
	private XbArticleVisitMapper xbArticleVisitMapper;
	@Resource
	private XbCommentMapper xbCommentMapper;
	
	//背景图片存放的本地路径
	@Value("${ftpclient.bgImgPath}")
	private String bgImgPath;
	@Value("${ftpclient.bgImgUrl}")
	private String bgImgUrl;
	
	@Override
	public List<ArticleCard> selAllArticleCard() {
		List<ArticleCard> articleCardList = new ArrayList<ArticleCard>();
		List<XbArticle> articleList = xbArticleMapper.selectByExample(null);
		List<Integer> randomList=new ArrayList<Integer>();//防止背景图片重复
		
		//洗牌算法：
//		String PATH = Thread.currentThread().getContextClassLoader().getResource("").getPath();
////		File filed = new File(PATH+"../../src/main/webapp/bg");
//		File filed = new File(PATH+"../../bg");
		
		File filed = new File(bgImgPath);
		File[] files=filed.listFiles();
		if(files!=null) {
			File tmp=null;
			Random random = new Random();
			for (int i = files.length-1 ; i > 1 ; i--) {
				int r=random.nextInt(i+1);
				tmp=files[r];
				files[r]=files[i];
				files[i]=tmp;
			}
		}
		int no=0;
		
		for (XbArticle xbArticle : articleList) {
			//可见，并且是文字类型
			if(xbArticle.getEx()!=0&&xbArticle.getTextorwallpaper()==0) {
				try {
					ArticleCard articleCard = new ArticleCard();
					articleCard.setId(xbArticle.getId());
					articleCard.setTitle(xbArticle.getTitle());
					articleCard.setUploadtime(xbArticle.getUploadtime());
					articleCard.setAuthorName(xbUserInfoMapper.selectByPrimaryKey(xbArticle.getAuthorId()).getNickname());
					articleCard.setOpenwords(xbArticle.getOpenwords());
					articleCard.setArticlebody(null);
//					articleCard.setArticlebody(xbArticle.getArticlebody());
					articleCard.setEx(1);
					articleCard.setTextorwallpaper(0);
					//获取点赞数
					XbArticleAgreeExample agreeExample=new XbArticleAgreeExample();
					agreeExample.createCriteria().andArticleIdEqualTo(xbArticle.getId());
					articleCard.setAgreeNumber(xbArticleAgreeMapper.countByExample(agreeExample));
					
					//获取收藏数
					XbArticleCollectExample collectExample=new XbArticleCollectExample();
					collectExample.createCriteria().andArticleIdEqualTo(xbArticle.getId());
					articleCard.setCollectNumber(xbArticleCollectMapper.countByExample(collectExample));
					
					//文章浏览数
					XbArticleVisitExample articleVisitExample=new XbArticleVisitExample();
					articleVisitExample.createCriteria().andArticleIdEqualTo(xbArticle.getId());
					articleCard.setVisitNumber(xbArticleVisitMapper.countByExample(articleVisitExample));
					
					//文章评论数
					XbCommentExample commentExample =new XbCommentExample();
					commentExample.createCriteria().andArticleIdEqualTo(xbArticle.getId());
					articleCard.setCommentNumber(xbCommentMapper.countByExample(commentExample));
					
					//最后编辑时间
					XbArticleLastAltertimeExample altertimeExample=new XbArticleLastAltertimeExample();
					altertimeExample.createCriteria().andArticleIdEqualTo(xbArticle.getId());
					List<XbArticleLastAltertime> lastTimeList = xbArticleLastAltertimeMapper.selectByExample(altertimeExample);
					if(lastTimeList!=null&&lastTimeList.size()>0) {
						articleCard.setLastAlterTime(lastTimeList.get(lastTimeList.size()-1).getLastAltertime());
					}
					
					//装入背景图片
					try {
						String backgroundImg=bgImgUrl+files[no].getName();
//						String backgroundImg="/bg/"+files[no].getName();
						if(no<files.length-1) {
							no++;
						}
						articleCard.setBackgroundImg(backgroundImg);
					} catch (Exception e) {
						System.out.println("装入背景图片出错");
					}
					
					//装入List 
					articleCardList.add(articleCard);
//					System.out.println(articleCard.getTitle()+":拼装成功！！");
				} catch (Exception e) {
					System.out.println("拼装时出错！！");
					e.printStackTrace();
				}
			}
		}
		System.out.println(articleCardList.size()+"篇文章:拼装成功！！");
		return articleCardList;
	}

}
