﻿using Amazon.S3;
using Amazon.S3.Transfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AwsWebApp1
{
    public class AmazonUploader
    {
        public bool sendMyFileToS3(string localFilePath, string bucketName, string subDirectoryInBucket, System.IO.Stream stream, string fileName)
        {
            // input explained :
            // localFilePath = the full local file path e.g. "c:\mydir\mysubdir\myfilename.zip"
            // bucketName : the name of the bucket in S3 ,the bucket should be alreadt created
            // subDirectoryInBucket : if this string is not empty the file will be uploaded to
            // a subdirectory with this name
            // fileNameInS3 = the file name in the S3

            // create an instance of IAmazonS3 class ,in my case i choose RegionEndpoint.EUWest1
            // you can change that to APNortheast1 , APSoutheast1 , APSoutheast2 , CNNorth1
            // SAEast1 , USEast1 , USGovCloudWest1 , USWest1 , USWest2 . this choice will not
            // store your file in a different cloud storage but (i think) it differ in performance
            // depending on your location
            IAmazonS3 client = Amazon.AWSClientFactory.CreateAmazonS3Client(Amazon.RegionEndpoint.USEast1);

            // create a TransferUtility instance passing it the IAmazonS3 created in the first step
            TransferUtility utility = new TransferUtility(client);
            // making a TransferUtilityUploadRequest instance
            var request = new TransferUtilityUploadRequest();


            var uploadRequest = new TransferUtilityUploadRequest
            {
                InputStream = stream,
                BucketName = bucketName,
                CannedACL = S3CannedACL.PublicRead,
                Key = fileName
            };

            if (subDirectoryInBucket == "" || subDirectoryInBucket == null)
            {
                request.BucketName = bucketName; //no subdirectory just bucket name
            }
            else
            {   // subdirectory and bucket name
                request.BucketName = bucketName + @"/" + subDirectoryInBucket;
            }
            //request.Key = fileNameInS3; //file name up in S3
            request.FilePath = localFilePath;
            //local file name
            utility.Upload(uploadRequest); //commensing the transfer


            return true; //indicate that the file was sent
        }
    }
}