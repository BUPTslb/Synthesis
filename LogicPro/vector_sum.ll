; ModuleID = 'vector_sum.c'
source_filename = "vector_sum.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @vector_sum(i32 noundef %0, float* nocapture noundef readonly %1, float* nocapture noundef readonly %2, float* nocapture noundef writeonly %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %4
  %7 = zext i32 %0 to i64
  br label %9

8:                                                ; preds = %9, %4
  ret void

9:                                                ; preds = %6, %9
  %10 = phi i64 [ 0, %6 ], [ %17, %9 ]
  %11 = getelementptr inbounds float, float* %1, i64 %10
  %12 = load float, float* %11, align 4, !tbaa !5
  %13 = getelementptr inbounds float, float* %2, i64 %10
  %14 = load float, float* %13, align 4, !tbaa !5
  %15 = fadd float %12, %14
  %16 = getelementptr inbounds float, float* %3, i64 %10
  store float %15, float* %16, align 4, !tbaa !5
  %17 = add nuw nsw i64 %10, 1
  %18 = icmp eq i64 %17, %7
  br i1 %18, label %8, label %9, !llvm.loop !9
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %0, i8** nocapture noundef readonly %1) local_unnamed_addr #1 {
  %3 = icmp eq i32 %0, 2
  br i1 %3, label %4, label %52

4:                                                ; preds = %2
  %5 = getelementptr inbounds i8*, i8** %1, i64 1
  %6 = load i8*, i8** %5, align 8, !tbaa !12
  %7 = call i64 @strtol(i8* nocapture noundef nonnull %6, i8** noundef null, i32 noundef 10) #6
  %8 = trunc i64 %7 to i32
  %9 = shl i64 %7, 32
  %10 = ashr exact i64 %9, 30
  %11 = call noalias i8* @malloc(i64 noundef %10) #6
  %12 = bitcast i8* %11 to float*
  %13 = call noalias i8* @malloc(i64 noundef %10) #6
  %14 = bitcast i8* %13 to float*
  %15 = call noalias i8* @malloc(i64 noundef %10) #6
  %16 = bitcast i8* %15 to float*
  %17 = icmp sgt i32 %8, 0
  br i1 %17, label %18, label %20

18:                                               ; preds = %4
  %19 = and i64 %7, 4294967295
  br label %42

20:                                               ; preds = %42, %4
  %21 = icmp sgt i32 %8, 0
  br i1 %21, label %22, label %34

22:                                               ; preds = %20
  %23 = and i64 %7, 4294967295
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i64 [ 0, %22 ], [ %32, %24 ]
  %26 = getelementptr inbounds float, float* %12, i64 %25
  %27 = load float, float* %26, align 4, !tbaa !5
  %28 = getelementptr inbounds float, float* %14, i64 %25
  %29 = load float, float* %28, align 4, !tbaa !5
  %30 = fadd float %27, %29
  %31 = getelementptr inbounds float, float* %16, i64 %25
  store float %30, float* %31, align 4, !tbaa !5
  %32 = add nuw nsw i64 %25, 1
  %33 = icmp eq i64 %32, %23
  br i1 %33, label %34, label %24, !llvm.loop !9

34:                                               ; preds = %24, %20
  %35 = shl i64 %7, 32
  %36 = add i64 %35, -4294967296
  %37 = ashr exact i64 %36, 32
  %38 = getelementptr inbounds float, float* %16, i64 %37
  %39 = load float, float* %38, align 4, !tbaa !5
  %40 = fpext float %39 to double
  %41 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double noundef %40)
  br label %52

42:                                               ; preds = %18, %42
  %43 = phi i64 [ 0, %18 ], [ %50, %42 ]
  %44 = call double @drand48() #6
  %45 = fptrunc double %44 to float
  %46 = getelementptr inbounds float, float* %12, i64 %43
  store float %45, float* %46, align 4, !tbaa !5
  %47 = call double @drand48() #6
  %48 = fptrunc double %47 to float
  %49 = getelementptr inbounds float, float* %14, i64 %43
  store float %48, float* %49, align 4, !tbaa !5
  %50 = add nuw nsw i64 %43, 1
  %51 = icmp eq i64 %50, %19
  br i1 %51, label %20, label %42, !llvm.loop !14

52:                                               ; preds = %2, %34
  %53 = phi i32 [ 0, %34 ], [ 1, %2 ]
  ret i32 %53
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @drand48() local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: mustprogress nofree nounwind willreturn
declare i64 @strtol(i8* noundef readonly, i8** nocapture noundef, i32 noundef) local_unnamed_addr #5

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !7, i64 0}
!14 = distinct !{!14, !10, !11}
