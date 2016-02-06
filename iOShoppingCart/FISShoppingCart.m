//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Molly Gingras on 2/6/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

- (NSUInteger)calculateTotalPriceInCents{
    return [[self.items valueForKeyPath:@"@sum.priceInCents"] unsignedIntegerValue];
}

- (void)addItem:(FISItem *)item{
    [self.items addObject:item];
}

- (void)removeItem:(FISItem *)item{
    [self.items removeObjectAtIndex:[self.items indexOfObject:item]];
}

- (void)removeAllItemsLikeItem:(FISItem *)item{
    while ([self.items indexOfObject:item] != NSNotFound) {
        [self removeItem:item];
    }
}

- (void)sortItemsByNameAsc{
    NSSortDescriptor *sortByName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [self.items sortUsingDescriptors:@[sortByName]];
}

- (void)sortItemsByNameDesc{
    NSSortDescriptor *sortByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    [self.items sortUsingDescriptors:@[sortByNameDesc]];
}

- (void)sortItemsByPriceInCentsAsc{
    NSSortDescriptor *sortByPrice = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    [self.items sortUsingDescriptors:@[sortByPrice]];
}

- (void)sortItemsByPriceInCentsDesc{
    NSSortDescriptor *sortByPriceDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    [self.items sortUsingDescriptors:@[sortByPriceDesc]];
}

- (NSArray *)allItemsWithName:(NSString *)name{
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    return [self.items filteredArrayUsingPredicate:namePredicate];
}

- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)argument{
    NSPredicate *minPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %li", argument];
    return [self.items filteredArrayUsingPredicate:minPricePredicate];
}

- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)argument{
    NSPredicate *maxPricePredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %li", argument];
    return [self.items filteredArrayUsingPredicate:maxPricePredicate];
}


@end
