resource "aws_s3_bucket" "jagsbuck01s" {
    bucket = "jaggsbucket" 
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.jagsbuck01s.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
  content_disposition = "inline"
  
}

resource "aws_s3_object" "error_object" {
  bucket = aws_s3_bucket.jagsbuck01s.id
  key    = "error.html"
  source = "error.html"
  content_type = "text/html"
  content_disposition = "inline"

}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.jagsbuck01s.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.jagsbuck01s.arn}/*"
      }
    ]
  })
}


