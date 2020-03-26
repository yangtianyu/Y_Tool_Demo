#import "Y_Sort.h"

@implementation Y_Sort
- (NSArray *)quickSortWithArray:(NSArray *)array {
    if (!array) {
        return @[];
    }
    if (array.count == 0 || array.count == 1) {
        return array;
    }
    NSMutableArray *sortedArray = [NSMutableArray array];
    NSInteger baseNumberIndex = random() % array.count;
    NSNumber *baseNumber = array[baseNumberIndex];
    NSMutableArray *unsortedArray = [array mutableCopy];
    [unsortedArray removeObjectAtIndex:baseNumberIndex];
    NSMutableArray *leftArray = [NSMutableArray array];
    NSMutableArray *rightArray = [NSMutableArray array];
    
    for (NSNumber *curNumber in unsortedArray) {
        if (curNumber.integerValue < baseNumber.integerValue) {
            [leftArray addObject:curNumber];
        } else {
            [rightArray addObject:curNumber];
        }
    }
    
    [sortedArray addObjectsFromArray:[self quickSortWithArray:[leftArray copy]]];
    [sortedArray addObject:baseNumber];
    [sortedArray addObjectsFromArray:[self quickSortWithArray:[rightArray copy]]];
    
    return sortedArray;
}
@end
