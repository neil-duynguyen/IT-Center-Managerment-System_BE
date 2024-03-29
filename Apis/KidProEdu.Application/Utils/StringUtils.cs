﻿using System.Security.Cryptography;
using System.Text;

namespace KidProEdu.Application.Utils
{
    public static class StringUtils
    {
        public static string Hash(this string input)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }

                return builder.ToString();
            }
        }

        //Hash signature momo
        public static string HmacSHA256(string inputData, string key)
        {
            byte[] keyByte = Encoding.UTF8.GetBytes(key);
            byte[] messageBytes = Encoding.UTF8.GetBytes(inputData);
            using (var hmacsha256 = new HMACSHA256(keyByte))
            {
                byte[] hashmessage = hmacsha256.ComputeHash(messageBytes);
                string hex = BitConverter.ToString(hashmessage);
                hex = hex.Replace("-", "").ToLower();
                return hex;
            }
        }

        public static string GenerateRandomString(int letterCount, int numberCount)
        {
            // Dùng StringBuilder để tạo và xây dựng chuỗi
            StringBuilder builder = new StringBuilder();

            // Thêm chữ cái RB vào chuỗi
            builder.Append("RB");

            // Dùng Random để tạo số ngẫu nhiên
            Random random = new Random();

            // Tạo chuỗi với 6 số ngẫu nhiên
            for (int i = 0; i < numberCount; i++)
            {
                // Tạo số ngẫu nhiên từ 0 đến 9 và thêm vào chuỗi
                builder.Append(random.Next(0, 10));
            }

            // Chuyển đổi StringBuilder thành chuỗi và trả về
            return builder.ToString();
        }
    }
}
