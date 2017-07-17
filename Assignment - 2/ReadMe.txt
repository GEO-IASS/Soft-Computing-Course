###
###
###


Software requirement : # Octave 4.0.2  (To install on ubuntu type : "sudo apt-get install octave" in ubuntu terminal)
		      # image package (To install package type : "pkg install -forge image;" in octave command line)
		      # Load image package (to load type : "pkg load image" in octave command line)
		      # Then to execute type "run" in octave command line
			

----These programs are done for Assignment-2 in Soft Computing Course-----

----Problem : Face recognition with PCA

---- Along with programs , I had also included dataset .
 

-----To execute the program use run.m program 
	1) Go to the directory,
	2) just type "run" at command line (assuming you are at correct directory)

	#run.m --- is the main script to run entire program
	#readfaces.m --- to read input dataset of faces
	#projectData.m --- to project training data into eigen space
	#normalizeFeatures.m --- to subtract mean from dataset.


DATASET : I used in this program , was from http://www.cs.princeton.edu/courses/archive/spr04/cos429/images/yalefaces2.zip
	# All face images are of size 243 x 320 gray images
	# is a collection of faces from researchers at Yale (15 people, 11 poses each).


WHAT I DID in Programs : It was given input as database of face images,
			# It took 70% database as training set
			# 30 % database as test set
			# Using the Algorithm : FACE RECOGNITION with PCA
			# It also draws the variance gained w.r.t no. of principle components
			# It takes no. of principle components such that variance = 85% by default , If you can change it by changing 				  variable "variance_gained" around line no.78 in "run.m" script.
			# It also calculated the Accuracy of correct detection on test set.
			

RESULTS :  70%-80% of accuracy of face recognition will make. 



###
###
###
