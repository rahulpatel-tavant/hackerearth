<?php

    class Node {
          public $info;
          public $left;
          public $right;
         
          public function __construct($info) {
                 $this->info = $info;
                 $this->left = NULL;
                 $this->right = NULL;
               
          }
          public function __toString() {
                 return "$this->info";
          }
    } 

    
    class SearchBinaryTree {
    	
          public $root;
          public function  __construct() {
                 $this->root = NULL;
          }
  
          public function create($info) {
              
                 if($this->root == NULL) {
                    $this->root = new Node($info);
                 } 
                 
                 else {
  
                    $current = $this->root;
                    
                    while(true) {
                          if($info < $current->info) {
                         
                                if($current->left) {
                                   $current = $current->left;
                                } else {
                                   $current->left = new Node($info);
                                   break; 
                                }
                          } else if($info > $current->info){
                                if($current->right) {
                                   $current = $current->right;
                                } else {
                                   $current->right = new Node($info);
                                   break; 
                                }
                          } else {
                            break;
                          }
                    } 
                 }
          }
          public function traverse($method) {
                 switch($method) {
                     case 'inorder':
                     $this->_inorder($this->root);
                     break;
                     case 'postorder':
                     $this->_postorder($this->root);
                     break;
    
                     case 'preorder':
                     $this->_preorder($this->root);
                     break;
   
                     default:
                     break;
                 } 
          } 
          private function _inorder($node) {
                          if($node->left) {
                             $this->_inorder($node->left); 
                          } 
                          echo $node. " ";
                          if($node->right) {
                             $this->_inorder($node->right); 
                          } 
          }
          private function _preorder($node) {
                          echo $node. " ";
                          if($node->left) {
                             $this->_preorder($node->left); 
                          } 
                          if($node->right) {
                             $this->_preorder($node->right); 
                          } 
          }
          private function _postorder($node) {
                          if($node->left) {
                             $this->_postorder($node->left); 
                          } 
                          if($node->right) {
                             $this->_postorder($node->right); 
                          } 
                          echo $node. " ";
          }
          
    } 
               $arr = array(8,3,1,6,4,7,10,14,13);
               $tree = new SearchBinaryTree();
               for($i=0,$n=count($arr);$i<$n;$i++) {
                   $tree->create($arr[$i]);
               }
   
    echo"<h1>Binary Search Tree</h1>"; 
    
    echo "<h2>Input vector: ", join($arr," "), "</h2>";
 
    echo"<h1>Inorder</h1>"; 
    $tree->traverse('inorder');
    echo"<h1>Postorder</h1>"; 
    $tree->traverse('postorder');
    echo"<h1>Preorder</h1>"; 
    $tree->traverse('preorder');
  
?>