package com.kh.develoffice;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		/*
		 * Date date = new Date(); DateFormat dateFormat =
		 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		 * 
		 * String formattedDate = dateFormat.format(date);
		 * 
		 * model.addAttribute("serverTime", formattedDate );
		 */
		
		return "main/mainPage";
	}
	@RequestMapping("mainPage.do")
	public String mainPageView() {
		return "main/mainPage";
	}
	
}
