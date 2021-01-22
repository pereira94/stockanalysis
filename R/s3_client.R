#' s3_client
#' @param boto3 boto3module
#' @export s3_client
s3_client <- function(boto3=NULL) {
  s3 = boto3$client("s3",
                    region_name='us-east-1',
                    aws_access_key_id=Sys.getenv("AWS_KEY_ID"),
                    aws_secret_access_key=Sys.getenv("AWS_SECRET"))
  s3
}
