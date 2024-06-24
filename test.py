import cv2


img = cv2.imread("/home/hungdv/tcgroup/Jetson/Face-Recognition-Jetson-Nano/photo_2024-06-22_11-30-54.jpg")
img2 = img.copy()
img2[:, :, 0] = img[:,:,1]
img2[:, :, 1] = img[:,:,0]
cv2.imshow("a", img)
cv2.waitKey(0)