%finaljvalue.m
%MATH467 Final Project
%computes the numeric value of the objection function J
function [jval] = finaljvalue(Z_star)

X_star = Z_star(1:100) +.85;
U_star = Z_star(101:end);
Y_star =ones(100,1) - X_star;

X_tar = ones(100,1) *.85;
Y_tar = ones(100,1)*.15;

Probs_star = vertcat(X_star,Y_star);
Probs_tar = vertcat(X_tar,Y_tar);

jval = (norm([Probs_star - Probs_tar]))^2+(norm(U_star))^2;