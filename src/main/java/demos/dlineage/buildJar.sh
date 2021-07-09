#!/bin/bash

cur_dir=$(pwd)


src_dir=$cur_dir
bin_dir=../../../../../lib
class_dir=$cur_dir/class

sudo chmod 777 $bin_dir/gudusoft.gsqlparser.jar

sudo rm -rf $src_dir/sources.list
find $src_dir -name "*.java" > $src_dir/sources.list
cat  $src_dir/sources.list

sudo mkdir $cur_dir/lib
sudo cp $bin_dir/gudusoft.gsqlparser.jar $cur_dir/lib

sudo chmod 777 $cur_dir/lib/gudusoft.gsqlparser.jar

sudo rm -rf $class_dir
sudo rm -rf $class_dir/lib
sudo mkdir $class_dir
sudo mkdir $class_dir/lib
sudo cp $cur_dir/MANIFEST.MF $class_dir
sudo cp -r $bin_dir/gudusoft.gsqlparser.jar $class_dir/lib



sudo javac -d $class_dir  -cp .:$bin_dir/gudusoft.gsqlparser.jar -g -sourcepath $src_dir @$src_dir/sources.list

sudo chmod 777 $class_dir/lib/gudusoft.gsqlparser.jar

cd $class_dir
sudo jar -cvfm $cur_dir/data_flow_analyzer.jar MANIFEST.MF *
sudo rm -rf $class_dir

