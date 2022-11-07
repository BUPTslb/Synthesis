; ModuleID = 'desSample.cpp'
source_filename = "desSample.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%struct.key_set = type { [8 x i8], [4 x i8], [4 x i8] }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@initial_key_permutaion = dso_local local_unnamed_addr global [56 x i32] [i32 57, i32 49, i32 41, i32 33, i32 25, i32 17, i32 9, i32 1, i32 58, i32 50, i32 42, i32 34, i32 26, i32 18, i32 10, i32 2, i32 59, i32 51, i32 43, i32 35, i32 27, i32 19, i32 11, i32 3, i32 60, i32 52, i32 44, i32 36, i32 63, i32 55, i32 47, i32 39, i32 31, i32 23, i32 15, i32 7, i32 62, i32 54, i32 46, i32 38, i32 30, i32 22, i32 14, i32 6, i32 61, i32 53, i32 45, i32 37, i32 29, i32 21, i32 13, i32 5, i32 28, i32 20, i32 12, i32 4], align 16
@sub_key_permutation = dso_local local_unnamed_addr global [48 x i32] [i32 14, i32 17, i32 11, i32 24, i32 1, i32 5, i32 3, i32 28, i32 15, i32 6, i32 21, i32 10, i32 23, i32 19, i32 12, i32 4, i32 26, i32 8, i32 16, i32 7, i32 27, i32 20, i32 13, i32 2, i32 41, i32 52, i32 31, i32 37, i32 47, i32 55, i32 30, i32 40, i32 51, i32 45, i32 33, i32 48, i32 44, i32 49, i32 39, i32 56, i32 34, i32 53, i32 46, i32 42, i32 50, i32 36, i32 29, i32 32], align 16
@message_expansion = dso_local local_unnamed_addr global [48 x i32] [i32 32, i32 1, i32 2, i32 3, i32 4, i32 5, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 28, i32 29, i32 30, i32 31, i32 32, i32 1], align 16
@S = dso_local local_unnamed_addr global [4 x [16 x i32]] [[16 x i32] [i32 14, i32 4, i32 13, i32 1, i32 2, i32 15, i32 11, i32 8, i32 3, i32 10, i32 6, i32 12, i32 5, i32 9, i32 0, i32 7], [16 x i32] [i32 0, i32 15, i32 7, i32 4, i32 14, i32 2, i32 13, i32 1, i32 10, i32 6, i32 12, i32 11, i32 9, i32 5, i32 3, i32 8], [16 x i32] [i32 4, i32 1, i32 14, i32 8, i32 13, i32 6, i32 2, i32 11, i32 15, i32 12, i32 9, i32 7, i32 3, i32 10, i32 5, i32 0], [16 x i32] [i32 15, i32 12, i32 8, i32 2, i32 4, i32 9, i32 1, i32 7, i32 5, i32 11, i32 3, i32 14, i32 10, i32 0, i32 6, i32 13]], align 16
@.str.2 = private unnamed_addr constant [9 x i8] c"shenlibo\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"12345678\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_desSample.cpp, i8* null }]

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind uwtable
define dso_local void @_Z20print_char_as_binaryc(i8 noundef signext %0) local_unnamed_addr #3 {
  %2 = sext i8 %0 to i32
  %3 = icmp sgt i8 %0, -1
  %4 = select i1 %3, i32 48, i32 49
  %5 = tail call i32 @putchar(i32 %4)
  %6 = and i32 %2, 64
  %7 = icmp eq i32 %6, 0
  %8 = select i1 %7, i32 48, i32 49
  %9 = tail call i32 @putchar(i32 %8)
  %10 = and i32 %2, 32
  %11 = icmp eq i32 %10, 0
  %12 = select i1 %11, i32 48, i32 49
  %13 = tail call i32 @putchar(i32 %12)
  %14 = and i32 %2, 16
  %15 = icmp eq i32 %14, 0
  %16 = select i1 %15, i32 48, i32 49
  %17 = tail call i32 @putchar(i32 %16)
  %18 = and i32 %2, 8
  %19 = icmp eq i32 %18, 0
  %20 = select i1 %19, i32 48, i32 49
  %21 = tail call i32 @putchar(i32 %20)
  %22 = and i32 %2, 4
  %23 = icmp eq i32 %22, 0
  %24 = select i1 %23, i32 48, i32 49
  %25 = tail call i32 @putchar(i32 %24)
  %26 = and i32 %2, 2
  %27 = icmp eq i32 %26, 0
  %28 = select i1 %27, i32 48, i32 49
  %29 = tail call i32 @putchar(i32 %28)
  %30 = and i32 %2, 1
  %31 = or i32 %30, 48
  %32 = tail call i32 @putchar(i32 %31)
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: mustprogress nofree nosync nounwind uwtable
define dso_local void @_Z17subkey_generationPKcP7key_set(i8* nocapture noundef readonly %0, %struct.key_set* nocapture noundef %1) local_unnamed_addr #5 {
  br label %3

3:                                                ; preds = %2, %3
  %4 = phi i64 [ 0, %2 ], [ %28, %3 ]
  %5 = getelementptr inbounds [56 x i32], [56 x i32]* @initial_key_permutaion, i64 0, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !5
  %7 = add nsw i32 %6, -1
  %8 = srem i32 %7, 8
  %9 = lshr i32 128, %8
  %10 = sdiv i32 %7, 8
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i8, i8* %0, i64 %11
  %13 = load i8, i8* %12, align 1, !tbaa !9
  %14 = trunc i32 %9 to i8
  %15 = and i8 %13, %14
  %16 = zext i8 %15 to i32
  %17 = shl nuw nsw i32 %16, %8
  %18 = and i32 %17, 255
  %19 = trunc i64 %4 to i32
  %20 = and i32 %19, 7
  %21 = lshr i32 %18, %20
  %22 = lshr i64 %4, 3
  %23 = and i64 %22, 536870911
  %24 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 0, i64 %23
  %25 = load i8, i8* %24, align 1, !tbaa !9
  %26 = trunc i32 %21 to i8
  %27 = or i8 %25, %26
  store i8 %27, i8* %24, align 1, !tbaa !9
  %28 = add nuw nsw i64 %4, 1
  %29 = icmp eq i64 %28, 56
  br i1 %29, label %30, label %3, !llvm.loop !10

30:                                               ; preds = %3
  %31 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 0, i64 0
  %32 = load i8, i8* %31, align 1, !tbaa !9
  %33 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 1, i64 0
  %34 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 0, i64 1
  %35 = load i8, i8* %34, align 1, !tbaa !9
  %36 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 1, i64 1
  %37 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 0, i64 2
  %38 = load i8, i8* %37, align 1, !tbaa !9
  %39 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 1, i64 2
  %40 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 0, i64 3
  %41 = load i8, i8* %40, align 1, !tbaa !9
  %42 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 1, i64 3
  %43 = shl i8 %41, 4
  %44 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 2, i64 0
  %45 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 0, i64 4
  %46 = load i8, i8* %45, align 1, !tbaa !9
  %47 = lshr i8 %46, 4
  %48 = or i8 %47, %43
  %49 = shl i8 %46, 4
  %50 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 2, i64 1
  %51 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 0, i64 5
  %52 = load i8, i8* %51, align 1, !tbaa !9
  %53 = lshr i8 %52, 4
  %54 = or i8 %53, %49
  %55 = shl i8 %52, 4
  %56 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 2, i64 2
  %57 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 0, i64 6
  %58 = load i8, i8* %57, align 1, !tbaa !9
  %59 = lshr i8 %58, 4
  %60 = or i8 %59, %55
  %61 = shl i8 %58, 4
  %62 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 2, i64 3
  %63 = tail call i8 @llvm.fshl.i8(i8 %32, i8 %35, i8 1)
  store i8 %63, i8* %33, align 1, !tbaa !9
  %64 = tail call i8 @llvm.fshl.i8(i8 %35, i8 %38, i8 1)
  store i8 %64, i8* %36, align 1, !tbaa !9
  %65 = tail call i8 @llvm.fshl.i8(i8 %38, i8 %41, i8 1)
  store i8 %65, i8* %39, align 1, !tbaa !9
  %66 = shl i8 %41, 1
  %67 = and i8 %66, -32
  %68 = lshr i8 %32, 3
  %69 = and i8 %68, 16
  %70 = or i8 %69, %67
  store i8 %70, i8* %42, align 1, !tbaa !9
  %71 = tail call i8 @llvm.fshl.i8(i8 %48, i8 %49, i8 1)
  store i8 %71, i8* %44, align 1, !tbaa !9
  %72 = tail call i8 @llvm.fshl.i8(i8 %54, i8 %55, i8 1)
  store i8 %72, i8* %50, align 1, !tbaa !9
  %73 = tail call i8 @llvm.fshl.i8(i8 %60, i8 %61, i8 1)
  store i8 %73, i8* %56, align 1, !tbaa !9
  %74 = shl i8 %58, 5
  %75 = lshr exact i8 %43, 3
  %76 = and i8 %75, 16
  %77 = or i8 %76, %74
  store i8 %77, i8* %62, align 1, !tbaa !9
  br label %78

78:                                               ; preds = %30, %95
  %79 = phi i64 [ 0, %30 ], [ %114, %95 ]
  %80 = getelementptr inbounds [48 x i32], [48 x i32]* @sub_key_permutation, i64 0, i64 %79
  %81 = load i32, i32* %80, align 4, !tbaa !5
  %82 = icmp slt i32 %81, 29
  br i1 %82, label %83, label %89

83:                                               ; preds = %78
  %84 = add nsw i32 %81, -1
  %85 = srem i32 %84, 8
  %86 = sdiv i32 %84, 8
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 1, i64 %87
  br label %95

89:                                               ; preds = %78
  %90 = add nsw i32 %81, -29
  %91 = and i32 %90, 7
  %92 = lshr i32 %90, 3
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 2, i64 %93
  br label %95

95:                                               ; preds = %89, %83
  %96 = phi i8* [ %94, %89 ], [ %88, %83 ]
  %97 = phi i32 [ %91, %89 ], [ %85, %83 ]
  %98 = lshr i32 128, %97
  %99 = load i8, i8* %96, align 1, !tbaa !9
  %100 = trunc i32 %98 to i8
  %101 = and i8 %99, %100
  %102 = zext i8 %101 to i32
  %103 = shl nuw nsw i32 %102, %97
  %104 = and i32 %103, 255
  %105 = trunc i64 %79 to i32
  %106 = and i32 %105, 7
  %107 = lshr i32 %104, %106
  %108 = lshr i64 %79, 3
  %109 = and i64 %108, 536870911
  %110 = getelementptr inbounds %struct.key_set, %struct.key_set* %1, i64 0, i32 0, i64 %109
  %111 = load i8, i8* %110, align 1, !tbaa !9
  %112 = trunc i32 %107 to i8
  %113 = or i8 %111, %112
  store i8 %113, i8* %110, align 1, !tbaa !9
  %114 = add nuw nsw i64 %79, 1
  %115 = icmp eq i64 %114, 48
  br i1 %115, label %116, label %78, !llvm.loop !12

116:                                              ; preds = %95
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind uwtable
define dso_local void @_Z15process_messagePKcPhP7key_set(i8* nocapture noundef readonly %0, i8* nocapture noundef writeonly %1, %struct.key_set* nocapture noundef readonly %2) local_unnamed_addr #5 {
  %4 = alloca [6 x i8], align 1
  %5 = alloca i32, align 4
  %6 = bitcast i32* %5 to [4 x i8]*
  %7 = bitcast i8* %1 to i64*
  store i64 0, i64* %7, align 1
  %8 = getelementptr inbounds [6 x i8], [6 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %8) #11
  %9 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #11
  %10 = bitcast i8* %0 to i32*
  %11 = load i32, i32* %10, align 1, !tbaa !9
  %12 = getelementptr i8, i8* %0, i64 4
  %13 = bitcast i8* %12 to i32*
  %14 = load i32, i32* %13, align 1, !tbaa !9
  store i32 %14, i32* %5, align 4, !tbaa !9
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %8, i8 0, i64 6, i1 false)
  br label %15

15:                                               ; preds = %3, %15
  %16 = phi i64 [ 0, %3 ], [ %40, %15 ]
  %17 = getelementptr inbounds [48 x i32], [48 x i32]* @message_expansion, i64 0, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !5
  %19 = add nsw i32 %18, -1
  %20 = srem i32 %19, 8
  %21 = lshr i32 128, %20
  %22 = sdiv i32 %19, 8
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 %23
  %25 = load i8, i8* %24, align 1, !tbaa !9
  %26 = trunc i32 %21 to i8
  %27 = and i8 %25, %26
  %28 = zext i8 %27 to i32
  %29 = shl nuw nsw i32 %28, %20
  %30 = and i32 %29, 255
  %31 = trunc i64 %16 to i32
  %32 = and i32 %31, 7
  %33 = lshr i32 %30, %32
  %34 = lshr i64 %16, 3
  %35 = and i64 %34, 536870911
  %36 = getelementptr inbounds [6 x i8], [6 x i8]* %4, i64 0, i64 %35
  %37 = load i8, i8* %36, align 1, !tbaa !9
  %38 = trunc i32 %33 to i8
  %39 = or i8 %37, %38
  store i8 %39, i8* %36, align 1, !tbaa !9
  %40 = add nuw nsw i64 %16, 1
  %41 = icmp eq i64 %40, 48
  br i1 %41, label %42, label %15, !llvm.loop !13

42:                                               ; preds = %15
  %43 = getelementptr inbounds %struct.key_set, %struct.key_set* %2, i64 0, i32 0, i64 0
  %44 = load i8, i8* %43, align 1, !tbaa !9
  %45 = load i8, i8* %8, align 1, !tbaa !9
  %46 = xor i8 %45, %44
  %47 = getelementptr inbounds %struct.key_set, %struct.key_set* %2, i64 0, i32 0, i64 1
  %48 = load i8, i8* %47, align 1, !tbaa !9
  %49 = getelementptr inbounds [6 x i8], [6 x i8]* %4, i64 0, i64 1
  %50 = load i8, i8* %49, align 1, !tbaa !9
  %51 = xor i8 %50, %48
  %52 = getelementptr inbounds %struct.key_set, %struct.key_set* %2, i64 0, i32 0, i64 2
  %53 = load i8, i8* %52, align 1, !tbaa !9
  %54 = getelementptr inbounds [6 x i8], [6 x i8]* %4, i64 0, i64 2
  %55 = load i8, i8* %54, align 1, !tbaa !9
  %56 = xor i8 %55, %53
  %57 = getelementptr inbounds %struct.key_set, %struct.key_set* %2, i64 0, i32 0, i64 3
  %58 = load i8, i8* %57, align 1, !tbaa !9
  %59 = getelementptr inbounds [6 x i8], [6 x i8]* %4, i64 0, i64 3
  %60 = load i8, i8* %59, align 1, !tbaa !9
  %61 = xor i8 %60, %58
  %62 = getelementptr inbounds %struct.key_set, %struct.key_set* %2, i64 0, i32 0, i64 4
  %63 = load i8, i8* %62, align 1, !tbaa !9
  %64 = getelementptr inbounds [6 x i8], [6 x i8]* %4, i64 0, i64 4
  %65 = load i8, i8* %64, align 1, !tbaa !9
  %66 = xor i8 %65, %63
  %67 = getelementptr inbounds %struct.key_set, %struct.key_set* %2, i64 0, i32 0, i64 5
  %68 = load i8, i8* %67, align 1, !tbaa !9
  %69 = getelementptr inbounds [6 x i8], [6 x i8]* %4, i64 0, i64 5
  %70 = load i8, i8* %69, align 1, !tbaa !9
  %71 = xor i8 %70, %68
  %72 = lshr i8 %46, 6
  %73 = and i8 %72, 2
  %74 = lshr i8 %46, 2
  %75 = and i8 %74, 1
  %76 = or i8 %75, %73
  %77 = lshr i8 %46, 3
  %78 = and i8 %77, 15
  %79 = zext i8 %76 to i64
  %80 = zext i8 %78 to i64
  %81 = getelementptr inbounds [4 x [16 x i32]], [4 x [16 x i32]]* @S, i64 0, i64 %79, i64 %80
  %82 = load i32, i32* %81, align 4, !tbaa !5
  %83 = trunc i32 %82 to i8
  %84 = shl i8 %83, 4
  %85 = and i8 %46, 2
  %86 = lshr i8 %51, 4
  %87 = and i8 %86, 1
  %88 = or i8 %87, %85
  %89 = shl i8 %46, 3
  %90 = and i8 %89, 8
  %91 = lshr i8 %51, 5
  %92 = or i8 %91, %90
  %93 = zext i8 %88 to i64
  %94 = zext i8 %92 to i64
  %95 = getelementptr inbounds [4 x [16 x i32]], [4 x [16 x i32]]* @S, i64 0, i64 %93, i64 %94
  %96 = load i32, i32* %95, align 4, !tbaa !5
  %97 = trunc i32 %96 to i8
  %98 = or i8 %84, %97
  %99 = lshr i8 %51, 2
  %100 = and i8 %99, 2
  %101 = lshr i8 %56, 6
  %102 = and i8 %101, 1
  %103 = or i8 %102, %100
  %104 = shl i8 %51, 1
  %105 = and i8 %104, 14
  %106 = lshr i8 %56, 7
  %107 = or i8 %106, %105
  %108 = zext i8 %103 to i64
  %109 = zext i8 %107 to i64
  %110 = getelementptr inbounds [4 x [16 x i32]], [4 x [16 x i32]]* @S, i64 0, i64 %108, i64 %109
  %111 = load i32, i32* %110, align 4, !tbaa !5
  %112 = trunc i32 %111 to i8
  %113 = shl i8 %112, 4
  %114 = lshr i8 %56, 4
  %115 = and i8 %114, 2
  %116 = and i8 %56, 1
  %117 = or i8 %115, %116
  %118 = lshr i8 %56, 1
  %119 = and i8 %118, 15
  %120 = zext i8 %117 to i64
  %121 = zext i8 %119 to i64
  %122 = getelementptr inbounds [4 x [16 x i32]], [4 x [16 x i32]]* @S, i64 0, i64 %120, i64 %121
  %123 = load i32, i32* %122, align 4, !tbaa !5
  %124 = trunc i32 %123 to i8
  %125 = or i8 %113, %124
  %126 = lshr i8 %61, 6
  %127 = and i8 %126, 2
  %128 = lshr i8 %61, 2
  %129 = and i8 %128, 1
  %130 = or i8 %129, %127
  %131 = lshr i8 %61, 3
  %132 = and i8 %131, 15
  %133 = zext i8 %130 to i64
  %134 = zext i8 %132 to i64
  %135 = getelementptr inbounds [4 x [16 x i32]], [4 x [16 x i32]]* @S, i64 0, i64 %133, i64 %134
  %136 = load i32, i32* %135, align 4, !tbaa !5
  %137 = trunc i32 %136 to i8
  %138 = shl i8 %137, 4
  %139 = and i8 %61, 2
  %140 = lshr i8 %66, 4
  %141 = and i8 %140, 1
  %142 = or i8 %141, %139
  %143 = shl i8 %61, 3
  %144 = and i8 %143, 8
  %145 = lshr i8 %66, 5
  %146 = or i8 %145, %144
  %147 = zext i8 %142 to i64
  %148 = zext i8 %146 to i64
  %149 = getelementptr inbounds [4 x [16 x i32]], [4 x [16 x i32]]* @S, i64 0, i64 %147, i64 %148
  %150 = load i32, i32* %149, align 4, !tbaa !5
  %151 = trunc i32 %150 to i8
  %152 = or i8 %138, %151
  %153 = lshr i8 %66, 2
  %154 = and i8 %153, 2
  %155 = lshr i8 %71, 6
  %156 = and i8 %155, 1
  %157 = or i8 %156, %154
  %158 = shl i8 %66, 1
  %159 = and i8 %158, 14
  %160 = lshr i8 %71, 7
  %161 = or i8 %160, %159
  %162 = zext i8 %157 to i64
  %163 = zext i8 %161 to i64
  %164 = getelementptr inbounds [4 x [16 x i32]], [4 x [16 x i32]]* @S, i64 0, i64 %162, i64 %163
  %165 = load i32, i32* %164, align 4, !tbaa !5
  %166 = trunc i32 %165 to i8
  %167 = shl i8 %166, 4
  %168 = lshr i8 %71, 4
  %169 = and i8 %168, 2
  %170 = and i8 %71, 1
  %171 = or i8 %169, %170
  %172 = lshr i8 %71, 1
  %173 = and i8 %172, 15
  %174 = zext i8 %171 to i64
  %175 = zext i8 %173 to i64
  %176 = getelementptr inbounds [4 x [16 x i32]], [4 x [16 x i32]]* @S, i64 0, i64 %174, i64 %175
  %177 = load i32, i32* %176, align 4, !tbaa !5
  %178 = trunc i32 %177 to i8
  %179 = or i8 %167, %178
  %180 = bitcast i8* %1 to i32*
  store i32 %11, i32* %180, align 1, !tbaa !9
  %181 = getelementptr inbounds i8, i8* %1, i64 4
  store i8 %98, i8* %181, align 1, !tbaa !9
  %182 = getelementptr inbounds i8, i8* %1, i64 5
  store i8 %125, i8* %182, align 1, !tbaa !9
  %183 = getelementptr inbounds i8, i8* %1, i64 6
  store i8 %152, i8* %183, align 1, !tbaa !9
  %184 = getelementptr inbounds i8, i8* %1, i64 7
  store i8 %179, i8* %184, align 1, !tbaa !9
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #11
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %8) #11
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: mustprogress nofree norecurse nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #7 {
  %1 = tail call noalias dereferenceable_or_null(8) i8* @malloc(i64 noundef 8) #11
  %2 = tail call noalias dereferenceable_or_null(8) i8* @malloc(i64 noundef 8) #11
  %3 = bitcast i8* %2 to %struct.key_set*
  tail call void @_Z17subkey_generationPKcP7key_set(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), %struct.key_set* noundef %3)
  tail call void @_Z15process_messagePKcPhP7key_set(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i8* noundef %1, %struct.key_set* noundef %3)
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #8

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_desSample.cpp() #9 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #11
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.fshl.i8(i8, i8, i8) #10

attributes #0 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { mustprogress nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #5 = { mustprogress nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #7 = { mustprogress nofree norecurse nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #11 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!7, !7, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
