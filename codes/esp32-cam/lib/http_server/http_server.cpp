#include "http_server.hpp"
#include "config.hpp"
#include "esp_camera.h"
#include "esp_http_server.h"
#include <Arduino.h>

namespace http_server {

    namespace {

        httpd_handle_t camera_httpd = NULL;  // handles config::ENDPOINT (port 80)

        esp_err_t capture_handler(httpd_req_t *req) {
            camera_fb_t *fb = esp_camera_fb_get();
            if (!fb) {
                Serial.println("Camera capture failed");
                httpd_resp_send_500(req);
                return ESP_FAIL;
            }

            esp_err_t res = httpd_resp_set_type(req, "image/jpeg");
            if (res == ESP_OK) {
                res = httpd_resp_set_hdr(req, "Content-Disposition", "inline; filename=capture.jpg");
            }
            if (res == ESP_OK) {
                res = httpd_resp_send(req, (const char*)fb->buf, fb->len);
            }

            esp_camera_fb_return(fb);
            return res;
        }

    }

    void start() {
        httpd_config_t camera_config = HTTPD_DEFAULT_CONFIG();
        camera_config.server_port = config::SERVER_PORT;
        camera_config.ctrl_port   = 32768;

        httpd_uri_t capture_uri = {
            .uri      = config::ENDPOINT,
            .method   = HTTP_GET,
            .handler  = capture_handler,
            .user_ctx = NULL
          };

        if (httpd_start(&camera_httpd, &camera_config) == ESP_OK) {
            httpd_register_uri_handler(camera_httpd, &capture_uri);
        }
    }

}