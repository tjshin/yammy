package com.study.yammy;

import org.springframework.context.annotation.Bean;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class TilesConfiguration {
	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();

		configurer.setDefinitions(new String[] { "classpath:/tiles/tiles.xml", "classpath:/tiles/tiles_bbs.xml",
				"classpath:/tiles/tiles_message.xml", "classpath:/tiles/tiles_member.xml",
				"classpath:/tiles/tiles_sikdang.xml", "classpath:/tiles/tiles_review.xml",
				"classpath:/tiles/tiles_chatbot.xml", "classpath:/tiles/tiles_notice.xml",
				"classpath:/tiles/tiles_ticket.xml", "classpath:/tiles/tiles_ocrtest.xml" });

		configurer.setCheckRefresh(true);
		return configurer;
	}

	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver tilesViewResolver = new TilesViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		return tilesViewResolver;
	}
}