package in.rgukt;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class MyDate{
	public String getMyDate(String from){
		String to = null;
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-dd", Locale.US);
			Date date = formatter.parse(from.trim());
			SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
			to = formatter1.format(date);
		} catch(ParseException e) {
			e.printStackTrace();
			System.out.println(e);
		}
		System.out.println(to.toUpperCase());
	return to.toUpperCase();	
	}
}
