//
//  NSDictionary+NullString.h
//  ZTLife
//
//  Created by raven on 16/4/12.
//  Copyright © 2016年 ZThink. All rights reserved.
//
//                      d*##$.
// zP"""""$e.           $"    $o
//4$       '$          $"      $
//'$        '$        J$       $F
// 'b        $k       $>       $
//  $k        $r     J$       d$
//  '$         $     $"       $~
//   '$        "$   '$E       $
//    $         $L   $"      $F ...
//     $.       4B   $      $$$*"""*b
//     '$        $.  $$     $$      $F
//      "$       R$  $F     $"      $
//       $k      ?$ u*     dF      .$
//       ^$.      $$"     z$      u$$$$e
//        #$b             $E.dW@e$"    ?$
//         #$           .o$$# d$$$$c    ?F
//          $      .d$$#" . zo$>   #$r .uF
//          $L .u$*"      $&$$$k   .$$d$$F
//           $$"            ""^"$$$P"$P9$
//          JP              .o$$$$u:$P $$
//          $          ..ue$"      ""  $"
//         d$          $F              $
//         $$     ....udE             4B
//          #$    """"` $r            @$
//           ^$L        '$            $F
//             RN        4N           $
//              *$b                  d$
//               $$k                 $F
//               $$b                $F
//                 $""               $F
//                 '$                $
//                  $L               $
//                  '$               $
//                   $               $

/* 该方法设计前景：
  
   服务器交互，返回的 NSDictionary 中包含 nil空数据，在iOS平台下，该数据会变成(null)、<null> 等类型的字符串
   
   处理方式：
 
   1.如果传进来的字典是 key、value(value是字符串/NSNumber等当个值)，将为空的字符串转为@""，并返回；
   2.如果传进来的字典是 key、value(value是 NSArray数组，数组每一个Item都是字典)，遍历数组，
     将Item转为字典，再对为空的字符串转为@""，并返回。
 
 */

#import <Foundation/Foundation.h>

@interface NSDictionary (NullString)

/**
 *  处理服务器返回数据为(null)、<null> 等类型的字符串，返回处理好的字典
 */
- (NSDictionary *)dataWithoutNullData;

@end
