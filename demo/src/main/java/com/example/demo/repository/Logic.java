package com.example.demo.repository;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import org.openxmlformats.schemas.spreadsheetml.x2006.main.CTAutoFilter;
import org.springframework.stereotype.Repository;

@Repository
public class Logic {
	public static void writeToAvgMacro(String sheetname, String path)
			throws InvalidFormatException, ParseException, IOException {

		try {
			// Object t = null;
			// model.addAttribute("CPU", (String)t);
			File file = new File(path);

			FileInputStream fip = new FileInputStream(file);
			XSSFWorkbook wbread = new XSSFWorkbook(fip);

			XSSFSheet sheet = wbread.getSheetAt(0);

			FileInputStream ip = new FileInputStream(
					new File("C:\\KPI\\KPI Mem.CPU Average Macro.xlsm"));

			XSSFWorkbook wbwrite = new XSSFWorkbook(ip);
			XSSFSheet avg = wbwrite.getSheet(sheetname);

			XSSFRow row;
			XSSFRow row1;
			Iterator<Row> rowiterator = sheet.iterator();

			int rowid = 1;
			row = sheet.getRow(1);
			rowiterator.next();
			while (rowiterator.hasNext()) {
				if (sheet.getRow(rowid) == null) {
					System.out.println("Null at row " + rowid);
					System.out.println("Rows Updated");
					break;
				}

				row = (XSSFRow) rowiterator.next();
				row1 = avg.getRow(rowid);

				int cellid;
				Iterator<Cell> celliterator = row.iterator();
				// if (sheetname.equals("AvgSwap")) {
				cellid = 0;
				// } else {
				// cellid = 1;
				// celliterator.next();
				// }
				while (celliterator.hasNext()) {
					Cell cell = celliterator.next();
					Cell cell1;
					if (row1 != null) {
						cell1 = row1.getCell(cellid);
					} else {
						row1 = avg.createRow(rowid);
						row1.createCell(cellid);
						cell1 = row1.getCell(cellid);
					}
					if (cell1 == null) {
						row1.createCell(cellid);
						cell1 = row1.getCell(cellid);
					}

					if (cell.getCellTypeEnum() != CellType._NONE && cell.getCellTypeEnum() != CellType.BLANK) {
						switch (cell.getCellTypeEnum()) {
						case ERROR:
							cell1.setCellErrorValue((byte) 0);
							break;
						case FORMULA:
							// cell1.setCellValue("");
							// System.out.print("%5d", cell.getCellFormula());
							cell1.setCellFormula(cell.getCellFormula());
							break;
						case NUMERIC:
							if (DateUtil.isCellDateFormatted(cell)) {
								String df = new DataFormatter().formatCellValue(cell);
								Date date = null;
								if (df.matches("\\d{1,2}:\\d{1,2}:\\d{1,2}")) {
									date = new SimpleDateFormat("HH:mm:ss").parse(df);
									cell1.setCellValue(date);
								} else {
									cell1.setCellValue(cell.getDateCellValue());
								}
							} else {
								double i = cell.getNumericCellValue();
								cell1.setCellValue(i);
							}
							break;
						case STRING:
							String st = cell.getStringCellValue();
							cell1.setCellValue(st);
							break;
						default:
							cell1.setCellValue(cell.getStringCellValue());
							break;
						}
						System.out.println("Updating row " + rowid + ", column " + cellid + " " + path);
						System.out.println();
					} else {
						break;
					}
					cellid++;
				}
				rowid++;
			}
			ip.close();

			FileOutputStream out = new FileOutputStream(
					new File("C:\\KPI\\KPI Mem.CPU Average Macro.xlsm"));

			wbwrite.write(out);
			out.close();
			wbread.close();
			wbwrite.close();
			fip.close();

			System.out.println("Done");
		} catch (NullPointerException | IOException e) {
			e.printStackTrace();
		}
		System.out.println("File parameter: " + path);
	}

	public static void run(String batchfilename) throws IOException {
		Runtime.getRuntime().exec("cmd /c " + batchfilename, null, new File("C:\\KPI\\"));
		// return "success";
	}

	public static void writeToMaxMacro(String sheetname, String path)
			throws InvalidFormatException, ParseException, IOException {

		try {
			// Object t = null;
			// model.addAttribute("CPU", (String)t);
			File file = new File(path);

			FileInputStream fip = new FileInputStream(file);
			XSSFWorkbook wbread = new XSSFWorkbook(fip);

			XSSFSheet sheet = wbread.getSheetAt(0);

			FileInputStream ip = new FileInputStream(
					new File("C:\\KPI\\KPI Memory.CPU Max macro.xlsm"));

			XSSFWorkbook wbwrite = new XSSFWorkbook(ip);
			XSSFSheet max = wbwrite.getSheet(sheetname);

			XSSFRow row;
			XSSFRow row1;
			Iterator<Row> rowiterator = sheet.iterator();

			int rowid = 1;
			row = sheet.getRow(1);
			rowiterator.next();
			while (rowiterator.hasNext()) {
				if (sheet.getRow(rowid) == null) {
					// System.out.println("Null at row "+ rowid);
					System.out.println("Rows Updated\n");
					break;
				}

				row = (XSSFRow) rowiterator.next();
				row1 = max.getRow(rowid);

				int cellid = 0;
				Iterator<Cell> celliterator = row.iterator();
				//celliterator.next();

				while (celliterator.hasNext()/* && cellid < row1.getLastCellNum()*/) {
					Cell cell;
					cell = celliterator.next();
					if ((sheetname.equals("MaxCom") || sheetname.equals("MaxKBCache")) && cellid == 3) {
						// cellid++;
						if (celliterator.hasNext()) {
							cell = celliterator.next();
						}
					}

					if (sheetname.equals("MaxKBCache") && cellid + 2 == row1.getLastCellNum() - 1) {
						// System.out.println("It is " + cellid + " for row " + rowid);
						break;
					}
					if (sheetname.equals("MaxCom") && cellid + 2 == row1.getLastCellNum() - 2
							&& celliterator.hasNext()) {
						if (rowid < 100)
							System.out.println("It is " + cellid + " for row " + rowid);
						cell = celliterator.next();
					}

					Cell cell1;
					if (row1 != null) {
						cell1 = row1.getCell(cellid);
					} else {
						row1 = max.createRow(rowid);
						row1.createCell(cellid);
						cell1 = row1.getCell(cellid);
					}
					if (cell1 == null) {
						row1.createCell(cellid);
						cell1 = row1.getCell(cellid);
					}
					
					if (cell.getCellTypeEnum() != CellType._NONE && cell.getCellTypeEnum() != CellType.BLANK) {
						switch (cell.getCellTypeEnum()) {
						case FORMULA:
							// cell1.setCellValue("");
							// System.out.print("%5d", cell.getCellFormula());
							cell1.setCellFormula(cell.getCellFormula());
							break;
						case NUMERIC:
							if (DateUtil.isCellDateFormatted(cell)) {
								String df = new DataFormatter().formatCellValue(cell);
								Date date = null;
								if (df.matches("\\d{1,2}:\\d{1,2}:\\d{1,2}")) {
									date = new SimpleDateFormat("HH:mm:ss").parse(df);
									cell1.setCellValue(date);
								} else {
									cell1.setCellValue(cell.getDateCellValue());
								}
							} else {
								double i = cell.getNumericCellValue();
								cell1.setCellValue(i);
							}
							break;
						case STRING:
							String st = cell.getStringCellValue();
							cell1.setCellValue(st);
							break;
						default:
							cell1.setCellValue(cell.getStringCellValue());
							break;
						}
						if (rowid == 1)
							System.out.println("Updating row " + rowid + ", column " + cellid);
						// System.out.println();
					} else {
						cell1.setCellValue("");
					}
					cellid++;
				}
				rowid++;
			}

			ip.close();

			FileOutputStream out = new FileOutputStream(
					new File("C:\\KPI\\KPI Memory.CPU Max macro.xlsm"));

			wbwrite.write(out);
			out.close();
			wbread.close();
			wbwrite.close();
			fip.close();

			System.out.println("Done");
		} catch (NullPointerException | IOException e) {
			e.printStackTrace();
		}
		System.out.println("File parameter: " + path);
	}

	/*
	 * public static void deleteFromMaxMacro(String sheetname, int cellid) throws
	 * IOException { FileInputStream ip = new FileInputStream( new
	 * File("C:/Users/sirwas/Desktop/Automation/KPI Memory.CPU Max macro.xlsm"));
	 * 
	 * XSSFWorkbook wbwrite = new XSSFWorkbook(ip); XSSFSheet max =
	 * wbwrite.getSheet(sheetname);
	 * 
	 * XSSFRow row; Iterator<Row> rowiterator = max.iterator(); rowiterator.next();
	 * while (rowiterator.hasNext()) { row = (XSSFRow) rowiterator.next();
	 * 
	 * for (int i = cellid; i < cellid + 3; i++) { Cell cell = row.getCell(i);
	 * cell.setCellValue(""); } } ip.close();
	 * 
	 * FileOutputStream out = new FileOutputStream( new
	 * File("C:/Users/sirwas/Desktop/Automation/KPI Memory.CPU Max macro.xlsm"));
	 * 
	 * wbwrite.write(out); wbwrite.close(); }
	 */

	public static void createFile() throws InvalidFormatException, ParseException, IOException {
		try {
			FileInputStream fip = new FileInputStream(
					new File("C:\\KPI\\KPI Memory.CPU Max macro.xlsm"));
			XSSFWorkbook wbread = new XSSFWorkbook(fip);

			XSSFSheet sheet = wbread.getSheet("Summary");

			XSSFWorkbook wbwrite = new XSSFWorkbook();
			XSSFSheet summary = wbwrite.createSheet();

			XSSFRow row;
			XSSFRow row1;
			Iterator<Row> rowiterator = sheet.iterator();

			int rowid = 0;
			while (rowiterator.hasNext()) {
				/*
				 * if (sheet.getRow(rowid) == null) { // System.out.println("Null at row "+
				 * rowid); System.out.println("Rows Updated\n"); break; }
				 */

				row = (XSSFRow) rowiterator.next();
				row1 = summary.createRow(rowid);

				int cellid = 0;
				Iterator<Cell> celliterator = row.iterator();

				while (celliterator.hasNext()) {
					Cell cell;
					cell = celliterator.next();

					Cell cell1;
					/*
					 * if (row1.getCell(cellid) == null) { System.out.println("Null at cell " +
					 * cellid); break; }
					 */
					cell1 = row1.createCell(cellid);
					switch (cell.getCellTypeEnum()) {
					case NUMERIC:
						double i = cell.getNumericCellValue();
						cell1.setCellValue(i);
						break;
					case STRING:
						String st = cell.getStringCellValue();
						cell1.setCellValue(st);
						break;
					default:
						cell1.setCellValue(cell.getStringCellValue());
						break;
					}
					cellid++;
				}
				rowid++;
			}

			DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			String d = dateFormat.format(date);
			File folder = new File("C:\\KPI\\KPI_" + d + "\\Output");
			folder.mkdir();
			File f = new File("C:\\KPI\\KPI_" + d + "\\Output\\Max" + d + ".xlsx");
			f.createNewFile();
			FileOutputStream out = new FileOutputStream(f);

			wbwrite.write(out);
			out.close();
			wbread.close();
			wbwrite.close();
			fip.close();

			System.out.println("Done");
		} catch (NullPointerException | IOException e) {
			e.printStackTrace();
		}

	}

	public static void createAvgFile() throws InvalidFormatException, ParseException, IOException {
		try {
			FileInputStream fip = new FileInputStream(
					new File("C:\\KPI\\KPI Mem.CPU Average Macro.xlsm"));
			XSSFWorkbook wbread = new XSSFWorkbook(fip);

			XSSFSheet sheet = wbread.getSheet("Summary");

			XSSFWorkbook wbwrite = new XSSFWorkbook();
			XSSFSheet summary = wbwrite.createSheet();

			XSSFRow row;
			row = sheet.getRow(2);
			int cellid = 5;

			XSSFRow row1;
			Cell cell1;

			/*
			 * for (int rowid = 0; rowid < 4; rowid++) { row1 = summary.createRow(rowid);
			 * for (int cellid1 = 0; cellid1 < 4; cellid1++) { cell1 =
			 * row1.createCell(cellid1); } }
			 */

			row1 = summary.createRow(0);
			cell1 = row1.createCell(0);
			cell1.setCellValue("Nodes");
			cell1 = row1.createCell(1);
			cell1.setCellValue("CPU");
			cell1 = row1.createCell(2);
			cell1.setCellValue("Cache Memory");
			cell1 = row1.createCell(3);
			cell1.setCellValue("Commit Memory");
			cell1 = row1.createCell(4);
			cell1.setCellValue("Swap");

			row1 = summary.createRow(1);
			cell1 = row1.createCell(0);
			cell1.setCellValue("1,2,3,6,7,8");
			int cellid1 = 1;

			double value = -1;
			while (cellid <= 11 && cellid1 <= 4) {
				Cell cell = row.getCell(cellid);
				cell1 = row1.createCell(cellid1);

				value = cell.getNumericCellValue();
				cell1.setCellValue(value);
				cellid1++;
				cellid += 2;
			}

			row = sheet.getRow(9);
			cellid = 5;

			row1 = summary.createRow(2);
			cell1 = row1.createCell(0);
			cell1.setCellValue("4,5");
			cellid1 = 1;

			while (cellid <= 11 && cellid1 <= 4) {
				Cell cell = row.getCell(cellid);
				cell1 = row1.createCell(cellid1);

				value = cell.getNumericCellValue();
				cell1.setCellValue(value);
				cellid1++;
				cellid += 2;
			}

			row = sheet.getRow(12);
			cellid = 5;

			row1 = summary.createRow(3);
			cell1 = row1.createCell(0);
			cell1.setCellValue("9");
			cellid1 = 1;

			while (cellid <= 11 && cellid1 <= 4) {
				Cell cell = row.getCell(cellid);
				cell1 = row1.createCell(cellid1);

				value = cell.getNumericCellValue();
				cell1.setCellValue(value);
				cellid1++;
				cellid += 2;
			}
			// System.out.print(value + "\t");

			DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			String d = dateFormat.format(date);
			File folder = new File("C:\\KPI\\KPI_" + d + "\\Output");
			folder.mkdir();
			File f = new File("C:\\KPI\\KPI_" + d + "\\Output\\Avg" + d + ".xlsx");
			f.createNewFile();
			FileOutputStream out = new FileOutputStream(f);

			wbwrite.write(out);
			out.close();
			wbread.close();
			wbwrite.close();
			wbwrite.close();
			fip.close();

			System.out.println("Done");
		} catch (NullPointerException | IOException e) {
			e.printStackTrace();
		}

	}

	public static void deleteWeekOldFile(String path) {
		try {
			Files.deleteIfExists(Paths.get(path));
			System.out.println("Deletion successful.");
		} catch (NoSuchFileException e) {
			System.out.println("No such file/directory exists");
		} catch (DirectoryNotEmptyException e) {
			System.out.println("Directory is not empty.");
		} catch (IOException e) {
			System.out.println("Invalid permissions.");
		}

		//System.out.println("Deletion successful.");
	}

	/*
	 * public static void filterMax(XSSFSheet sheetname) { CTAutoFilter sheetFilter
	 * = sheetname.getCTWorksheet().getAutoFilter(); CTFilterColumn myFilterColumn =
	 * sheetFilter.insertNewFilterColumn(0); myFilterColumn.setColId(1L);
	 * CTCustomFilters myCustomFilter=myFilterColumn.addNewCustomFilters();
	 * CTCustomFilter myFilter1= myCustomFilter.addNewCustomFilter();
	 * myFilter1.setVal("AB*"); // Filter records that begin with AB
	 * 
	 * XSSFRow r1; for(Row r : sheetname) { for (Cell c : r) { if
	 * (c.getColumnIndex() == 1 && !c.getStringCellValue().contains("06")) {
	 * r1=(XSSFRow) c.getRow(); } } } }
	 */

}
