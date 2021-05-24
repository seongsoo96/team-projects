package ppeonfun.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryption {
	
	public String encryption(String password) {
		MessageDigest md;
		String hex = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
			md.update(password.getBytes());
			hex = String.format("%064x", new BigInteger(1, md.digest()));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return hex;
	}
}
