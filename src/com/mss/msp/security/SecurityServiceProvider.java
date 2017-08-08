/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mss.msp.security;

/**
 * *****************************************************************************
 *
 * Project : ServicesBay V1
 *
 * Package :
 *
 * Date : Feb 16, 2015, 7:53 PM
 *
 * Author : Services Bay Team
 *
 * File : SecurityServiceProvider.java
 *
 * Copyright 2015 Miracle Software Systems, Inc. All rights reserved. MIRACLE
 * SOFTWARE PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 * *****************************************************************************
 */
import com.mss.msp.util.ConnectionProvider;
import com.mss.msp.util.ServiceLocatorException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author miracle
 */
public class SecurityServiceProvider {

	private static SecurityServiceProvider _instance;

	/**
	 * Creates a new instance of DefaultDataProvider
	 */
	public SecurityServiceProvider() {
	}

	/**
	 * @return An instance of the DataServiceLocator class
	 * @throws ServiceLocatorException
	 */
	/*
	 * public static SecurityServiceProvider getInstance() throws
	 * ServiceLocatorException { try { if(_instance==null) { _instance = new
	 * SecurityServiceProvider(); } } catch (Exception ex) { throw new
	 * ServiceLocatorException(ex); } return _instance; }
	 */
	private static Logger log = Logger.getLogger(SecurityServiceProvider.class);
	private static final String ALPHA_CAPS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	private static final String ALPHA = "abcdefghijklmnopqrstuvwxyz";
	private static final String NUM = "0123456789";
	private static final String SPL_CHARS = "!@#$%^&*_=+-/";

	/**
	 * *****************************************************************************
	 *
	 * Author :
	 *
	 * Method : generateRandamSecurityKey() is for generating Random Security
	 * Key
	 *
	 * *****************************************************************************
	 */
	public static String generateRandamSecurityKey(int minLen, int maxLen, int noOfCAPSAlpha, int noOfDigits,
			int noOfSplChars) {
		log.info("************Entered into SecurityServiceProvider :: generateRandamSecurityKey*********");
		if (minLen > maxLen) {
			throw new IllegalArgumentException("Min. Length > Max. Length!");
		}
		if ((noOfCAPSAlpha + noOfDigits + noOfSplChars) > minLen) {
			throw new IllegalArgumentException(
					"Min. Length should be atleast sum of (CAPS, DIGITS, SPL CHARS) Length!");
		}
		Random rnd = new Random();
		int len = rnd.nextInt(maxLen - minLen + 1) + minLen;
		char[] pswd = new char[len];
		int index = 0;
		for (int i = 0; i < noOfCAPSAlpha; i++) {
			index = getNextIndex(rnd, len, pswd);
			pswd[index] = ALPHA_CAPS.charAt(rnd.nextInt(ALPHA_CAPS.length()));
		}
		for (int i = 0; i < noOfDigits; i++) {
			index = getNextIndex(rnd, len, pswd);
			pswd[index] = NUM.charAt(rnd.nextInt(NUM.length()));
		}
		for (int i = 0; i < noOfSplChars; i++) {
			index = getNextIndex(rnd, len, pswd);
			pswd[index] = SPL_CHARS.charAt(rnd.nextInt(SPL_CHARS.length()));
		}
		for (int i = 0; i < len; i++) {
			if (pswd[i] == 0) {
				pswd[i] = ALPHA.charAt(rnd.nextInt(ALPHA.length()));
			}
		}
		log.info("************End of SecurityServiceProvider :: generateRandamSecurityKey*********");
		return pswd.toString();
	}

	private static int getNextIndex(Random rnd, int len, char[] pswd) {
		int index = rnd.nextInt(len);
		while (pswd[index = rnd.nextInt(len)] != 0)
			;
		return index;
	}

	/**
	 * *****************************************************************************
	 *
	 * Author :
	 *
	 * Method : getEncrypt() is for getting encrypted password
	 *
	 * *****************************************************************************
	 */
	public static String getEncrypt(String plainText, String salt) {
		System.out.println(salt + "==----------------------------------------------------------------------------"
				+ "--------------------------" + plainText);
		log.info("************Entered into SecurityServiceProvider :: getEncrypt*********");
		// String salt = "Random";
		MessageDigest messageDigest = null;
		try {
			messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.update((plainText + salt).getBytes());
			System.out.println(messageDigest.toString()
					+ "==----------------------------beftor that ------------------------------------------------"
					+ "--------------------------" + messageDigest);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		String encryptedPassword = (new BigInteger(messageDigest.digest())).toString(16);
		System.out.println("==----------------------------beftor that ------------------------------------------------"
				+ "--------------------------" + encryptedPassword);
		// System.out.println("Encrypted Password: " + encryptedPassword);
		log.info("************End of SecurityServiceProvider :: getEncrypt*********");
		return encryptedPassword;

	}

	/**
	 * *****************************************************************************
	 *
	 * Author :
	 *
	 * Method : doRedirect() is for getting home action for user
	 *
	 * *****************************************************************************
	 */
	public static String doRedirect(int orgId, String typeofuser, int primaryrole)
			throws ServiceLocatorException, SQLException {
		log.info("************Entered into SecurityServiceProvider :: doRedirect*********");
		String actionName = "";
		String actionStatus = "";
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		connection = ConnectionProvider.getInstance().getConnection();
		// String queryString = "SELECT action_name FROM home_redirect_action
		// where org_id=" + orgId + " and type_of_user='" + typeofuser + "' and
		// primaryrole=" + primaryrole + " and status='Active'";
		String queryString = "SELECT action_name, status FROM home_redirect_action where org_id=" + orgId
				+ " and type_of_user='" + typeofuser + "' and primaryrole=" + primaryrole;
		System.out.println("-----------------------------------------------------" + queryString);
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(queryString);
			while (resultSet.next()) {
				actionName = resultSet.getString("action_name");
				actionStatus = resultSet.getString("status");
			}
			if (actionStatus.equals("Inactive")) {
				return "../general/logout.action";
			}
			log.info("************ SecurityServiceProvider :: doRedirect***Query******" + queryString);
			log.info("************ SecurityServiceProvider :: doRedirect*****Action Name****" + actionName);
			log.info("************End of SecurityServiceProvider :: doRedirect*********");
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {

			try {
				// resultSet Object Checking if it's null then close and set
				// null
				if (resultSet != null) {
					resultSet.close();
					resultSet = null;
				}

				if (statement != null) {
					statement.close();
					statement = null;
				}

				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException ex) {
				throw new ServiceLocatorException(ex);
			}
		}

		return actionName;

	}

	public boolean DoAuthorizationCheck(int orgid, List roleMap, String access_name, int ismanager, int isLead,
			int accesstoBoth) throws ServiceLocatorException, SQLException {

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean check = false;
		connection = ConnectionProvider.getInstance().getConnection();
		String queryString = "select role_id from site_access_rules where org_id=" + orgid
				+ " and access_flag=1 and access_name like '" + access_name + "'";
		// System.out.println("queryString-->" + queryString);
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(queryString);

			for (int i = 0; i < roleMap.size(); i++) {
				if (resultSet.next()) {
					if (roleMap.get(i).equals(resultSet.getString("role_id"))) {
						check = true;
						break;
					}

				}

			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
					resultSet = null;
				}
				if (statement != null) {
					statement.close();
					statement = null;
				}
				if (connection != null) {
					connection.close();
					connection = null;
				}
			} catch (SQLException ex) {
				throw new ServiceLocatorException(ex);
			}
		}
		return check;
	}
	/*
	 * public static void main(String[] args) { int noOfCAPSAlpha = 4; int
	 * noOfDigits = 4; int noOfSplChars = 4; int minLen = 30; int maxLen = 50;
	 * 
	 * 
	 * String pswd = generateRandamSecurityKey(minLen, maxLen, noOfCAPSAlpha,
	 * noOfDigits, noOfSplChars); System.out.println("Len = " + pswd.length() +
	 * ", " + new String(pswd));
	 * 
	 * }
	 */

	/*public static String doEncryption() throws Exception {

		// Generate public and private keys using RSA
		Map<String, Object> keys = getRSAKeys();

		PrivateKey privateKey = (PrivateKey) keys.get("private");
		PublicKey publicKey = (PublicKey) keys.get("public");

		// First create an AES Key
		String secretAESKeyString = "KCPg+lJXpOkeyBM5Dk9wkw==";// getSecretAESKeyAsString();
		// String secretAESKeyString = "userAESSecretKey";

		System.out.println("secretAESKeyString--->" + secretAESKeyString); // UdTsRruNjUNH+LyDIT/kLQ==
																			// +kDvSNwVrS/A6yeII1JZag==

		

		File inputFile = new File("pay.pdf");
		File encryptedFile = new File("pay.encrypted.pdf");
		File decryptedFile = new File("pay.decrypted.pdf");

		// Encrypt our data with AES key

		encryptFileUsingAES(secretAESKeyString, inputFile, encryptedFile);

		// Encrypt AES Key with RSA Private Key
		String encryptedAESKeyString = encryptAESKey(secretAESKeyString, privateKey);

		// The following logic is on the other side.

		// First decrypt the AES Key with RSA Public key
		String decryptedAESKeyString = decryptAESKey(encryptedAESKeyString, publicKey);

		// System.out.println("encryptedAESKeyString--->" +
		// encryptedAESKeyString);
		// System.out.println("decryptedAESKeyString--->" +
		// decryptedAESKeyString);

		// Now decrypt data using the decrypted AES key!

		// decryptFileUsingAES(decryptedAESKeyString, encryptedFile,
		// decryptedFile);

		// System.out.println("AES Key:" + secretAESKeyString);

	} */

	// Create a new AES key. Uses 128 bit
	public static String getSecretAESKeyAsString() throws Exception {
		KeyGenerator generator = KeyGenerator.getInstance("AES");
		generator.init(128); // The AES key size in number of bits
		SecretKey secKey = generator.generateKey();
		String encodedKey = Base64.getEncoder().encodeToString(secKey.getEncoded());
		return encodedKey;
	}

	// Encrypt File using AES key
	public static void encryptFileUsingAES(String aesKeyString, File inputFile, File outputFile) throws Exception {
		byte[] decodedKey = Base64.getDecoder().decode(aesKeyString);
		SecretKey originalKey = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");

		// AES defaults to AES/ECB/PKCS5Padding in Java 7
		Cipher aesCipher = Cipher.getInstance("AES");
		aesCipher.init(Cipher.ENCRYPT_MODE, originalKey);
		// byte[] byteCipherText = aesCipher.doFinal(plainText.getBytes());
		// return Base64.getEncoder().encodeToString(byteCipherText);
		FileInputStream inputStream = new FileInputStream(inputFile);
		byte[] inputBytes = new byte[(int) inputFile.length()];
		inputStream.read(inputBytes);

		byte[] outputBytes = aesCipher.doFinal(inputBytes);

		FileOutputStream outputStream = new FileOutputStream(outputFile);
		outputStream.write(outputBytes);

		inputStream.close();
		outputStream.close();
	}

	// Decrypt text using AES key
	public static byte[] decryptFileUsingAES(String secretAESKeyString, File inputFile)
			throws Exception {

		Map<String, Object> keys = getRSAKeys();

		PrivateKey privateKey = (PrivateKey) keys.get("private");
		PublicKey publicKey = (PublicKey) keys.get("public");

		String encryptedAESKeyString = encryptAESKey(secretAESKeyString, privateKey);

		// The following logic is on the other side.

		// First decrypt the AES Key with RSA Public key
		String decryptedAESKeyString = decryptAESKey(encryptedAESKeyString, publicKey);

		byte[] decodedKey = Base64.getDecoder().decode(decryptedAESKeyString);
		SecretKey originalKey = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");

		// AES defaults to AES/ECB/PKCS5Padding in Java 7
		Cipher aesCipher = Cipher.getInstance("AES");
		aesCipher.init(Cipher.DECRYPT_MODE, originalKey);
		FileInputStream inputStream = new FileInputStream(inputFile);
		byte[] inputBytes = new byte[(int) inputFile.length()];
		inputStream.read(inputBytes);

		byte[] outputBytes = aesCipher.doFinal(inputBytes);

		/*FileOutputStream outputStream = new FileOutputStream(outputFile);
		outputStream.write(outputBytes); */

		inputStream.close();
		return outputBytes;
		//outputStream.close();
	}

	// Get RSA keys. Uses key size of 2048.
	private static Map<String, Object> getRSAKeys() throws Exception {
		KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
		keyPairGenerator.initialize(2048);
		KeyPair keyPair = keyPairGenerator.generateKeyPair();
		PrivateKey privateKey = keyPair.getPrivate();
		PublicKey publicKey = keyPair.getPublic();

		Map<String, Object> keys = new HashMap<String, Object>();
		keys.put("private", privateKey);
		keys.put("public", publicKey);
		System.out.println("privateKey--->" + privateKey.toString());
		System.out.println("publicKey--->" + publicKey.toString());
		return keys;
	}
	
	// Encrypt AES Key using RSA private key
		private static String encryptAESKey(String plainAESKey, PrivateKey privateKey) throws Exception {
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.ENCRYPT_MODE, privateKey);
			return Base64.getEncoder().encodeToString(cipher.doFinal(plainAESKey.getBytes()));
		}

	// Decrypt AES Key using RSA public key
	private static String decryptAESKey(String encryptedAESKey, PublicKey publicKey) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, publicKey);
		return new String(cipher.doFinal(Base64.getDecoder().decode(encryptedAESKey)));
	}

	

}
