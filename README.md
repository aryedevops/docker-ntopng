# ntopng image for Docker

This is a Docker container image for ntopng, a High-Speed Web-based Traffic Analysis and Flow Collection.

More information about ntopng:
http://www.ntop.org/products/traffic-analysis/ntop/

Use the image as follows:

```
docker pull virtualzone/ntopng
docker run --net=host --name=ntopng -t virtualzone/ntopng
```