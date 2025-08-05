package com.intellimarket.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.intellimarket.admin.service.BannerService;
import com.intellimarket.store.service.StoreInfoService;

@Controller
@RequestMapping("/")
public class HomeController {
	@Autowired BannerService bannerService;
	@Autowired StoreInfoService storeInfoService;
	
	@GetMapping
	public String home(Model model) {
        return "redirect:/shop/main";
    }
	
}
