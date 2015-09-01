//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Danny Fenjves on 8/31/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

-(NSUInteger) calculateTotalPriceInCents{
    NSUInteger totalPriceInCents = 0;
    for (FISItem *item in self.items) {
        totalPriceInCents += item.priceInCents;
    }
    return totalPriceInCents;
}

-(void)addItem:(FISItem *)item{
    [self.items addObject: item];
}

-(void)removeItem:(FISItem *)item{
    NSUInteger indexOfItem = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:indexOfItem];
}

-(void)removeAllItemsLikeItem:(FISItem *)item{
    [self.items removeObject:item];
}

-(void)sortItemsByNameAsc{
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sortByNameAsc]]mutableCopy];
}

-(void)sortItemsByNameDesc{
    NSSortDescriptor *sortByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO selector:@selector(caseInsensitiveCompare:)];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sortByNameDesc]]mutableCopy];
}

-(void)sortItemsByPriceInCentsAsc{
    NSSortDescriptor *sortByPriceAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sortByPriceAsc]]mutableCopy];
}

-(void)sortItemsByPriceInCentsDesc{
    NSSortDescriptor *sortByPriceDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    self.items = [[self.items sortedArrayUsingDescriptors:@[sortByPriceDesc]]mutableCopy];
}

-(NSArray *)allItemsWithName:(NSString *)name{
    NSPredicate *filterByName = [NSPredicate predicateWithFormat:@"name LIKE %@",name];
    NSArray *filteredItems = [self.items filteredArrayUsingPredicate:filterByName];
    return filteredItems;
}

-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price{
    NSPredicate *filterByMinPrice = [NSPredicate predicateWithFormat:@"priceInCents >= %i",price];
    NSArray *filteredItems = [self.items filteredArrayUsingPredicate:filterByMinPrice];
    return filteredItems;
}

-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price{
    NSPredicate *filterByMaxPrice = [NSPredicate predicateWithFormat:@"priceInCents <= %i",price];
    NSArray *filteredItems = [self.items filteredArrayUsingPredicate:filterByMaxPrice];
    return filteredItems;
}

@end
