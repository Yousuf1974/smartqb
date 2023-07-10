<?php
namespace App\Traits;

trait CameraTrait {
    /**
     * store image from camera data
     * @var $imagedata is base64 data
     * @var $dir image store directory
     * @return boolean
     */
    public function store_camera_image($imagedata, $dir) {
	    $img = str_replace(' ', '+', str_replace('data:image/jpeg;base64,', '', $imagedata));
        return file_put_contents($dir, base64_decode($img));
    }
}