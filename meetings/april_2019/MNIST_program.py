# Import our favorites
import os, io, time, numpy as np, matplotlib.pyplot as plt, tensorflow as tf
from tensorflow import keras
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Conv2D, Dropout, Flatten, MaxPooling2D

# Start with downloading your data
mnist_data = keras.datasets.mnist
(train_images, train_labels), (test_images, test_labels) = mnist_data.load_data()

# Look at your data
plt.figure()
plt.imshow(train_images[0], cmap = "gray")
plt.title("TEST")
plt.show()

for i in range(0, 10):
    ct = 0
    while train_labels[ct] != i: ct+=1
    plt.figure()
    plt.imshow(train_images[ct], cmap = "gray")
    plt.title(i)
    plt.show()

# Reshape your data so it works with keras
train_images = train_images.reshape(train_images.shape[0], 28, 28, 1)
test_images = test_images.reshape(test_images.shape[0], 28, 28, 1)
train_images = train_images.astype('float32')
test_images = test_images.astype('float32')
train_images /= 255
test_images /= 255

# Create your Sequentail Model and start adding layers
model = Sequential()

# 1st Convolve Layer and Pool
input_shape1 = (28, 28, 1)
model.add(Conv2D(32, kernel_size=(5, 5), input_shape = input_shape1,
                 padding = "same", activation = tf.nn.relu))
model.add(MaxPooling2D(pool_size=(2, 2), strides = 2))

# 2nd Convole Layer and Pool
input_shape2 = (14, 14, 32)
model.add(Conv2D(64, kernel_size=(5, 5), input_shape = input_shape2,
                 padding = "same", activation = tf.nn.relu))
model.add(MaxPooling2D(pool_size=(2, 2), strides = 2))

# Flatten Data
model.add(Flatten())

# 1st Hidden Layer this can be any number
# but we are going to set it to a 1/3 of of pixels (i.e. 7*7*64/3 = 1067)
model.add(Dense(1067, activation=tf.nn.relu))

# Dropout consists in randomly setting a fraction rate of input units to 0
# at each updateduring training time, which helps prevent
# overfitting.
model.add(Dropout(0.4))

# 2nd Hidden Layer (FINAL)
# final layer must always have the number of outputs wnated
model.add(Dense(10, activation = tf.nn.softmax))

# Compile IT!
model.compile(optimizer = 'adam', loss = 'sparse_categorical_crossentropy',
              metrics = ['accuracy'])

# FIT IT
model.fit(x = train_images, y = train_labels, epochs = 2)

# Test it
model.evaluate(test_images, test_labels)

# Look at it
for i in range(0, 10):
    ct = 0
    while test_labels[ct] != i: ct+=1
    pred = model.predict(test_images[ct].reshape(1, 28, 28, 1))
    print(pred.argmax())
    plt.figure()
    im = test_images[ct]
    im = im.reshape(28, 28)
    plt.imshow(im, cmap = "gray")
    plt.title(pred.argmax())
    plt.show()

