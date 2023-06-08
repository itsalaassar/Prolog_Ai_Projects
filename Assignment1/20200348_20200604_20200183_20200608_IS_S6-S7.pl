friend(ahmed, samy).
friend(ahmed, fouad).
friend(samy, mohammed).
friend(samy, said).
friend(samy, omar).
friend(samy, abdullah).
friend(fouad, abdullah).
friend(abdullah, khaled).
friend(abdullah, ibrahim).
friend(abdullah, omar).
friend(mostafa, marwan).
friend(marwan, hassan).
friend(hassan, ali).

friend(hend, aisha).
friend(hend, mariam).
friend(hend, khadija).
friend(huda, mariam).
friend(huda, aisha).
friend(huda, lamia).
friend(mariam, hagar).
friend(mariam, zainab).
friend(aisha, zainab).
friend(lamia, zainab).
friend(zainab, rokaya).
friend(zainab, eman).
friend(eman, laila).


%Task1
is_friend(X,Y):-
    friend(Y,X).
is_friend(X,Y):-
    friend(X,Y).


%Task2
my_member(Element, [Element|_]).
my_member(Element, [_|Tail]) :-
    my_member(Element, Tail).
friendList(Person, FriendsList) :-
    friendList(Person, [], FriendsList), !.
friendList(Person, Tmp, FriendsList) :-
    friend(Person, Friend),
    \+(my_member(Friend, Tmp)),
    friendList(Person, [Friend|Tmp], FriendsList).
friendList(_, FriendsList, FriendsList).


%Task3
friendListCount(Person, Count) :-
    friendListCount(Person, 0, Count),!.
friendListCount(Person, Tmp, Count) :-
    friend(Person, Friend),
    NewTmp is Tmp + 1,
    friendListCount(Friend, NewTmp, Count).
friendListCount(_, Count, Count).


%Task4
peopleYouMayKnow(F1,F2):-
  is_friend(F3,F2),
  is_friend(F1,F3),
  F1 \= F2.


%Bonus Task
peopleYouMayKnow_indirect(P,W) :-
    friend(P,Y),
    friend(Y,Z),
    friend(Z,W),
    \+(friend(W,P)),
    \+(friend(P,Z)),
    P \= W.
