import CameraPhoto, { FACING_MODES, IMAGE_TYPES } from 'jslib-html5-camera-photo';

// get video element from html view
let videoElement = document.querySelector('#user_profile_video');
// user image preview container
let imagePreview = document.querySelector('#user_profile_preview');

// camera status button 
let cameraStart = document.querySelector('#camera_button');
// capture button
let captureButton = document.querySelector('#capture_btn');
// retake capture button
let retryButton = document.querySelector('#retry_camera');
// stop camera button
let stopCameraButton = document.querySelector('#close_camera');
// change camera button
let changeCamera = document.querySelector('#change_camera');
// file input
let fileInput = document.querySelector('#camera_phone_input');
// user profile input from upload
let profileInput = document.querySelector('#user_profile');

// init camera 
// instantiate CameraPhoto with the videoElement
let cameraPhoto = new CameraPhoto(videoElement);

// set cammera mood
var camera_mood = 0;
// camera image config
const config = {
    sizeFactor : 1,
    imageType : IMAGE_TYPES.JPG,
    imageCompression : .95,
    isImageMirror : false,
};

var camera_devices = [];

var image_setting = { width: 225, height: 225 };

// start camera
cameraStart.addEventListener('click', () => {
    cameraPhoto.enumerateCameras()
    .then(cameras_ => {
        cameras_.forEach(camera => {
            let {deviceId} = camera;
            camera_devices.push(deviceId);
        })
    }).then(() => {
        cameraPhoto.startCamera(camera_devices[camera_mood], image_setting)
        .then(() => {
            imagePreview.style.display = 'none'; // hide image preview
            videoElement.style.display = 'block'; // show camera enviroment
        
        }).catch(error => {
            console.log('Error', error);
        });
    })
    .catch(err => {
        console.log('Camera Not Started', err.message);
    });
    
    
});

changeCamera.addEventListener('click', () => {

    if((camera_devices.length < camera_mood) || (camera_devices.length === 0)){
        camera_mood = 0;
    }else {
        camera_mood += 1;
    }
   
    cameraPhoto.startCamera(camera_devices[camera_mood], image_setting)
    .then((res) => {
        imagePreview.style.display = 'none'; // hide image preview
        videoElement.style.display = 'block'; // show camera enviroment
        console.log('camera start');
    }).catch(error => {
        console.log('Error', error);
    });
});

// take photo | capture photo
captureButton.addEventListener('click', () => {
    let dataUri = cameraPhoto.getDataUri(config);
    videoElement.style.display = 'none'; // hide camera enviroment
    imagePreview.style.display = 'block'; // show image preview
    imagePreview.src = dataUri;
    fileInput.value = dataUri;
    profileInput.value = ''; // user profile value hide
});

// retake photo 
retryButton.addEventListener('click', () => {
    videoElement.style.display = 'block'; // hide camera enviroment
    imagePreview.style.display = 'none'; // show image preview
});

// stop camera
stopCameraButton.addEventListener('click', () => {
    cameraPhoto.stopCamera()
    .then(() => {
        imagePreview.style.display = 'block'; // show image preview
        videoElement.style.display = 'none'; // hide camera enviroment
        console.log('Camera stoped!');
    })
    .catch((error) => {
        console.log('No camera to stop!:', error);
    });
});