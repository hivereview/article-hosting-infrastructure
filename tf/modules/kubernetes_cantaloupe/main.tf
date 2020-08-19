
resource "helm_release" "cantaloupe_service" {
  depends_on = [var.service_depends_on]
  name  = "cantaloupe"
  chart = "./chart"

  values = [<<EOF
s3:
  endpoint: ${var.s3_endpoint}
  accessKey: ${var.s3_access_key}
  secretKey: ${var.s3_secret_key}
  bucketName: ${var.bucket_name}
  cacheKey: ${var.cache_key}
  imageLocationPrefix: ${var.image_location_prefix}
EOF
  ]
}
