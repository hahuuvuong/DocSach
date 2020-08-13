package ebook.controller;


import java.io.IOException;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller
public class ExcelController {
	@RequestMapping(value = "excel", method = RequestMethod.GET)
	public String viewExcel() {
		return "test";
	}
	@RequestMapping(value = "import", method = RequestMethod.POST)
	public String viewExcel(@RequestParam("file") MultipartFile reapExcelDataFile) throws IOException {

	    XSSFWorkbook workbook = new XSSFWorkbook(reapExcelDataFile.getInputStream());
	    XSSFSheet worksheet = workbook.getSheetAt(0);

	    for(int i=0;i<worksheet.getPhysicalNumberOfRows() ;i++) {

	        XSSFRow row = worksheet.getRow(i);

	        System.out.println(row.getCell(0).getNumericCellValue());
	        System.out.println(row.getCell(2).getNumericCellValue());
	    }
	    workbook.close();
	    return "index";
	}
}
