/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import java.net.InetAddress;
import java.net.UnknownHostException;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author vgponciano
 */
public class Client {
    
    public static String getClientIp(HttpServletRequest request) {
        System.out.println("Request : ");
        String remoteAddr = "";

        if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
        }
        System.out.println("Client Host Name : " + request.getRemoteHost());
        return remoteAddr;
    }

    public static String getClientName(HttpServletRequest request) {
        String hostname = request.getRemoteHost(); // hostname
        System.out.println("hostname" + hostname);

        String computerName = null;
        String remoteAddress = request.getRemoteAddr();
        System.out.println("remoteAddress: " + remoteAddress);
        try {
            InetAddress inetAddress = InetAddress.getByName(remoteAddress);
            System.out.println("inetAddress: " + inetAddress);
            computerName = inetAddress.getHostName();

            System.out.println("computerName: " + computerName);

            if (computerName.equalsIgnoreCase("localhost")) {
                computerName = java.net.InetAddress.getLocalHost().getCanonicalHostName();
            }
        } catch (UnknownHostException e) {

        }

        System.out.println("computerName: " + computerName);
         return computerName;
    }
}
