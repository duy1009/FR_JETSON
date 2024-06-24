

PROJECT_DIR = /home/hungdv/tcgroup/Jetson/Face-Recognition-Jetson-Nano
CPP_DIR = ${PROJECT_DIR}/src
O_DIR = obj/Debug/src
NCNN_LIB = /usr/local/lib/ncnn
NCNN_INCLUDE = /usr/local/include/ncnn
OPENCV_INCLUDE = /usr/include/opencv4
VULKAN_SO = /usr/lib/aarch64-linux-gnu
EXE_FILE = bin/Debug/FaceRecognition
LIBS = -fopenmp -I${OPENCV_INCLUDE} -lopencv_stitching -lopencv_alphamat -lopencv_aruco -lopencv_barcode -lopencv_bgsegm -lopencv_bioinspired -lopencv_ccalib -lopencv_dnn_objdetect -lopencv_dnn_superres -lopencv_dpm -lopencv_face -lopencv_freetype -lopencv_fuzzy -lopencv_hdf -lopencv_hfs -lopencv_img_hash -lopencv_intensity_transform -lopencv_line_descriptor -lopencv_mcc -lopencv_quality -lopencv_rapid -lopencv_reg -lopencv_rgbd -lopencv_saliency -lopencv_shape -lopencv_stereo -lopencv_structured_light -lopencv_phase_unwrapping -lopencv_superres -lopencv_optflow -lopencv_surface_matching -lopencv_tracking -lopencv_highgui -lopencv_datasets -lopencv_text -lopencv_plot -lopencv_ml -lopencv_videostab -lopencv_videoio -lopencv_viz -lopencv_wechat_qrcode -lopencv_ximgproc -lopencv_video -lopencv_xobjdetect -lopencv_objdetect -lopencv_calib3d -lopencv_imgcodecs -lopencv_features2d -lopencv_dnn -lopencv_flann -lopencv_xphoto -lopencv_photo -lopencv_imgproc -lopencv_core -ldl -lpthread -pthread -lgomp -DNDEBUG -rdynamic
MAIN_NAME = main_2

build:
	g++ -D__ANDROID__ -D__ARM_NEON -DNDEBUG -Wall -Wno-unknown-pragmas -isystem -fPIE -fopenmp -pthread -g -I${OPENCV_INCLUDE}-I${NCNN_INCLUDE} -Iinclude -c ${CPP_DIR}/main.cpp -o ${O_DIR}/main.o

	g++ -D__ANDROID__ -D__ARM_NEON -DNDEBUG -Wall -Wno-unknown-pragmas -isystem -fPIE -fopenmp -pthread -g -I${OPENCV_INCLUDE} -I${NCNN_INCLUDE} -Iinclude -c ${CPP_DIR}/TMtCNN.cpp -o ${O_DIR}/TMtCNN.o

	g++  -o ${EXE_FILE} ${O_DIR}/${MAIN_NAME}.o ${O_DIR}/TArcface.o ${O_DIR}/TBlur.o ${O_DIR}/TLive.o ${O_DIR}/TMtCNN.o ${O_DIR}/TRetina.o ${O_DIR}/TWarp.o  -O3 ${LIBS} ${NCNN_LIB}/libncnn.a ${NCNN_LIB}/libglslang.a ${NCNN_LIB}/libSPIRV.a ${NCNN_LIB}/libMachineIndependent.a ${NCNN_LIB}/libOGLCompiler.a ${NCNN_LIB}/libOSDependent.a ${NCNN_LIB}/libGenericCodeGen.a ${VULKAN_SO}/libvulkan.so

build_x86:
	g++ -D__ANDROID__ -DNDEBUG -Wall -Wno-unknown-pragmas -isystem -fPIE -fopenmp -pthread -g -I${OPENCV_INCLUDE} -I${NCNN_INCLUDE} -Iinclude -c ${CPP_DIR}/TArcface.cpp -o obj/Debug/src/TArcface.o
	g++ -D__ANDROID__ -DNDEBUG -Wall -Wno-unknown-pragmas -isystem -fPIE -fopenmp -pthread -g -I${OPENCV_INCLUDE} -I${NCNN_INCLUDE} -Iinclude -c ${CPP_DIR}/TLive.cpp -o obj/Debug/src/TLive.o
	g++ -D__ANDROID__ -DNDEBUG -Wall -Wno-unknown-pragmas -isystem -fPIE -fopenmp -pthread -g -I${OPENCV_INCLUDE} -I${NCNN_INCLUDE} -Iinclude -c ${CPP_DIR}/TRetina.cpp -o obj/Debug/src/TRetina.o
	g++ -D__ANDROID__ -DNDEBUG -Wall -Wno-unknown-pragmas -isystem -fPIE -fopenmp -pthread -g -I${OPENCV_INCLUDE} -I${NCNN_INCLUDE} -Iinclude -c ${CPP_DIR}/TWarp.cpp -o obj/Debug/src/TWarp.o
	g++ -D__ANDROID__ -DNDEBUG -Wall -Wno-unknown-pragmas -isystem -fPIE -fopenmp -pthread -g -I${OPENCV_INCLUDE} -I${NCNN_INCLUDE} -Iinclude -c ${CPP_DIR}/TMtCNN.cpp -o ${O_DIR}/TMtCNN.o
	g++ -D__ANDROID__ -DNDEBUG -Wall -Wno-unknown-pragmas -isystem -fPIE -fopenmp -pthread -g -I${OPENCV_INCLUDE} -I${NCNN_INCLUDE} -Iinclude -c ${CPP_DIR}/${MAIN_NAME}.cpp -o ${O_DIR}/${MAIN_NAME}.o

	g++  -o ${EXE_FILE} ${O_DIR}/${MAIN_NAME}.o ${O_DIR}/TArcface.o ${O_DIR}/TBlur.o ${O_DIR}/TLive.o ${O_DIR}/TMtCNN.o ${O_DIR}/TRetina.o ${O_DIR}/TWarp.o  -O3 ${LIBS} ${NCNN_LIB}/libncnn.a ${NCNN_LIB}/libglslang.a ${NCNN_LIB}/libSPIRV.a ${NCNN_LIB}/libMachineIndependent.a ${NCNN_LIB}/libOGLCompiler.a ${NCNN_LIB}/libOSDependent.a ${NCNN_LIB}/libGenericCodeGen.a ${VULKAN_SO}/libvulkan.so

build_main_x86:
	g++ -D__ANDROID__ -DNDEBUG -Wall -Wno-unknown-pragmas -isystem -fPIE -fopenmp -pthread -g -I${OPENCV_INCLUDE} -I${NCNN_INCLUDE} -Iinclude -c ${CPP_DIR}/${MAIN_NAME}.cpp -o ${O_DIR}/${MAIN_NAME}.o
	g++  -o ${EXE_FILE} ${O_DIR}/${MAIN_NAME}.o ${O_DIR}/TArcface.o ${O_DIR}/TBlur.o ${O_DIR}/TLive.o ${O_DIR}/TMtCNN.o ${O_DIR}/TRetina.o ${O_DIR}/TWarp.o  -O3 ${LIBS} ${NCNN_LIB}/libncnn.a ${NCNN_LIB}/libglslang.a ${NCNN_LIB}/libSPIRV.a ${NCNN_LIB}/libMachineIndependent.a ${NCNN_LIB}/libOGLCompiler.a ${NCNN_LIB}/libOSDependent.a ${NCNN_LIB}/libGenericCodeGen.a ${VULKAN_SO}/libvulkan.so


RUN_FILE = . ${PROJECT_DIR}/${EXE_FILE}
run:
	xterm -T FaceRecognition -e /usr/bin/cb_console_runner LD_LIBRARY_PATH=:${RUN_FILE}
