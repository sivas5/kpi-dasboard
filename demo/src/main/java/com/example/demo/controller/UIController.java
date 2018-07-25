package com.example.demo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.repository.Logic;


@Controller
public class UIController {

	@RequestMapping("/welcome")
	public String xyz(Model model) {
		return "home";
	}

	@RequestMapping("/success")
	public String execute(/*
							 * @RequestParam("CPU") String CPUpath, @RequestParam("Swap") String Swappath,
							 * 
							 * @RequestParam("Mem") String Mempath
							 */) throws InvalidFormatException, ParseException, IOException, InterruptedException {
		Map<String, String> avgmap = new LinkedHashMap<>();

		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();

		String d = dateFormat.format(date);

		File dir = new File("C:\\KPI\\KPI_" + d); //C:\KPI\KPI_20180718
		// File dir = new File("C:\\KPI");
		// File dir = new File("C:\\Users\\sirwas\\Desktop\\Automation\\");
		/*
		 * File[] dirs = dir.listFiles(new WildcardFileFilter("Test*.java"); for (int
		 * i=0; i<dirs.length; i++) { File dir1 = dirs[i]; if (dir1.isDirectory()) {
		 * File[] files = dir.listFiles(new WildcardFileFilter("sample*.java")); } }
		 */

		// String CPUpath =
		// "C:\\Users\\sirwas\\Desktop\\Automation\\Pega_CPU_20180104_0842.xlsx";
		// String Mempath =
		// "C:\\Users\\sirwas\\Desktop\\Automation\\Pega_Memory_20180104_0842.xlsx";
		// String Swappath =
		// "C:\\Users\\sirwas\\Desktop\\Automation\\Pega_SWAP_20180104_0842.xlsx";

		// String CPUpath = "C:\\Users\\sirwas\\Desktop\\Automation\\Pega_CPU_" +
		// ".*.xlsx";

		String[] files = dir.list(new FilenameFilter() {
			@Override
			public boolean accept(File dir, String name) {
				return (name.contains("Pega_CPU_") && name.contains(d));
			}
		});

		String CPUpath = "";
		try {
			CPUpath = dir + "\\" + files[0];
		} catch (NullPointerException e) {
			System.out.println("Today's file doesn't exist!!");
			return "Error";
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("Today's file doesn't exist!!");
			return "Error";
		}

		String[] files1 = dir.list(new FilenameFilter() {
			@Override
			public boolean accept(File dir, String name) {
				return (name.contains("Pega_Memory_") && name.contains(d));
			}
		});

		String Mempath = "";
		try {
			Mempath = dir + "\\" + files1[0];
		} catch (NullPointerException e) {
			System.out.println("Today's file doesn't exist!!");
			return "Error";
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("Today's file doesn't exist!!");
			return "Error";
		}

		String[] files2 = dir.list(new FilenameFilter() {
			@Override
			public boolean accept(File dir, String name) {
				return (name.contains("Pega_SWAP_") && name.contains(d));
			}
		});

		String Swappath = "";
		try {
			Swappath = dir + "\\" + files2[0];
		} catch (NullPointerException e) {
			System.out.println("Today's file doesn't exist!!");
			return "Error";
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("Today's file doesn't exist!!");
			return "Error";
		}

		avgmap.put("AvgCPU", CPUpath);
		avgmap.put("AvgMem", Mempath);
		avgmap.put("AvgSwap", Swappath);

		for (Map.Entry<String, String> entry : avgmap.entrySet()) {
			Logic.writeToAvgMacro(entry.getKey(), entry.getValue());
		}

		DateFormat dateFormat1 = new SimpleDateFormat("MM/dd/yy");

		Calendar cal1 = Calendar.getInstance();
		cal1.add(Calendar.DATE, -1);

		String d1 = dateFormat1.format(cal1.getTime());

		Date date_value = (Date) dateFormat1.parse(d1);

		FileInputStream ip = new FileInputStream(new File("C:\\KPI\\KPI Mem.CPU Average Macro.xlsm"));

		XSSFWorkbook wbwrite = new XSSFWorkbook(ip);
		XSSFSheet avg = wbwrite.getSheet("Summary");

		XSSFRow row;

		row = avg.getRow(1);

		Cell cell;

		cell = row.getCell(3);
		cell.setCellValue(date_value);

		cell = row.getCell(4);
		cell.setCellValue(date_value);

		ip.close();

		FileOutputStream out = new FileOutputStream(new File("C:\\KPI\\KPI Mem.CPU Average Macro.xlsm"));

		wbwrite.write(out);
		wbwrite.close();
		out.close();

		Logic.run("batch.bat");
		Thread.sleep(40000);

		Logic.createAvgFile();
		// Thread.sleep(20000);

		DateFormat dateFormat7 = new SimpleDateFormat("yyyyMMdd");

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -7);
		String file = "C:\\KPI\\KPI_" + dateFormat7.format(cal.getTime()) + "\\Output\\Avg"
				+ dateFormat7.format(cal.getTime()) + ".xlsx";

		Logic.deleteWeekOldFile(file);
		return "maxcomplete";
	}

	@RequestMapping("/maxcomplete")
	public String executemax(/*
								 * @RequestParam("CPU_max") String CPUmaxpath, @RequestParam("Memory_max")
								 * String Memorypath
								 */) throws InvalidFormatException, ParseException, IOException, InterruptedException {

		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();

		String d = dateFormat.format(date);

		// File dir = new File("C:\\Users\\sirwas\\Desktop\\Automation\\");
		// File dir = new File("C:\\KPI");
		File dir = new File("C:\\KPI\\KPI_" + d);

		String[] files = dir.list(new FilenameFilter() {
			@Override
			public boolean accept(File dir, String name) {
				return (name.contains("Pega_CPU_") && name.contains(d));
			}
		});

		String CPUmaxpath = "";
		try {
			CPUmaxpath = dir + "\\" + files[0];
		} catch (NullPointerException e) {
			System.out.println("Today's file doesn't exist!!");
			return "Error";
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("Today's file doesn't exist!!");
			return "Error";
		}

		String[] files1 = dir.list(new FilenameFilter() {
			@Override
			public boolean accept(File dir, String name) {
				return (name.contains("Pega_Memory_") && name.contains(d));
			}
		});

		String Memorypath = "";
		try {
			Memorypath = dir + "\\" + files1[0];
		} catch (NullPointerException e) {
			System.out.println("Today's file doesn't exist!!");
			return "Error";
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("Today's file doesn't exist!!");
			return "Error";
		}

		Map<String, String> maxmap = new LinkedHashMap<>();
		maxmap.put("MaxKBCache", Memorypath);
		maxmap.put("MaxCom", Memorypath);
		maxmap.put("MaxCPU", CPUmaxpath);
		for (Map.Entry<String, String> entry : maxmap.entrySet()) {
			Logic.writeToMaxMacro(entry.getKey(), entry.getValue());
		}

		System.out.println("Before batch file");
		Logic.run("batchmax.bat");
		System.out.println("After batch file"); // Thread.sleep(420000);//7 mins
		Thread.sleep(660000); // 11 mins

		Logic.createFile();
		System.out.println("file created");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -7);
		DateFormat dateFormat7 = new SimpleDateFormat("yyyyMMdd");
		String file = "C:\\KPI\\KPI_" + dateFormat7.format(cal.getTime()) + "\\Output\\Max"
				+ dateFormat7.format(cal.getTime()) + ".xlsx";
		Logic.deleteWeekOldFile(file);
		System.out.println("Waiting for display");

		return "maxcomplete";
	}


}
