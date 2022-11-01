; ModuleID = 'run_des.c'
source_filename = "run_des.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.key_set = type { [8 x i8], [4 x i8], [4 x i8] }

@.str = private unnamed_addr constant [69 x i8] c"You must provide at least 1 parameter, where you specify the action.\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"-g\00", align 1
@.str.2 = private unnamed_addr constant [64 x i8] c"Invalid # of parameter specified. Usage: run_des -g keyfile.key\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@key_file = internal global %struct._IO_FILE* null, align 8
@.str.4 = private unnamed_addr constant [34 x i8] c"Could not open file to write key.\00", align 1
@.str.5 = private unnamed_addr constant [34 x i8] c"Error writing key to output file.\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"-e\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"-d\00", align 1
@.str.8 = private unnamed_addr constant [98 x i8] c"Invalid # of parameters (%d) specified. Usage: run_des [-e|-d] keyfile.key input.file output.file\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.10 = private unnamed_addr constant [37 x i8] c"Could not open key file to read key.\00", align 1
@.str.11 = private unnamed_addr constant [53 x i8] c"Key read from key file does nto have valid key size.\00", align 1
@input_file = internal global %struct._IO_FILE* null, align 8
@.str.12 = private unnamed_addr constant [40 x i8] c"Could not open input file to read data.\00", align 1
@output_file = internal global %struct._IO_FILE* null, align 8
@.str.13 = private unnamed_addr constant [42 x i8] c"Could not open output file to write data.\00", align 1
@.str.14 = private unnamed_addr constant [14 x i8] c"Encrypting..\0A\00", align 1
@.str.15 = private unnamed_addr constant [14 x i8] c"Decrypting..\0A\00", align 1
@.str.16 = private unnamed_addr constant [50 x i8] c"Finished processing %s. Time taken: %lf seconds.\0A\00", align 1
@.str.17 = private unnamed_addr constant [62 x i8] c"Invalid action: %s. First parameter must be [ -g | -e | -d ].\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, i8** noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double, align 8
  %9 = alloca i64, align 8
  %10 = alloca i16, align 2
  %11 = alloca i32, align 4
  %12 = alloca i16, align 2
  %13 = alloca i8*, align 8
  %14 = alloca i16, align 2
  %15 = alloca i8*, align 8
  %16 = alloca i16, align 2
  %17 = alloca i16, align 2
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i8*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca %struct.key_set*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %23 = load i32, i32* %4, align 4
  %24 = icmp slt i32 %23, 2
  br i1 %24, label %25, label %27

25:                                               ; preds = %2
  %26 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i64 0, i64 0))
  store i32 1, i32* %3, align 4
  br label %296

27:                                               ; preds = %2
  %28 = load i8**, i8*** %5, align 8
  %29 = getelementptr inbounds i8*, i8** %28, i64 1
  %30 = load i8*, i8** %29, align 8
  %31 = call i32 @strcmp(i8* noundef %30, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)) #5
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %69

33:                                               ; preds = %27
  %34 = load i32, i32* %4, align 4
  %35 = icmp ne i32 %34, 3
  br i1 %35, label %36, label %38

36:                                               ; preds = %33
  %37 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([64 x i8], [64 x i8]* @.str.2, i64 0, i64 0))
  store i32 1, i32* %3, align 4
  br label %296

38:                                               ; preds = %33
  %39 = load i8**, i8*** %5, align 8
  %40 = getelementptr inbounds i8*, i8** %39, i64 2
  %41 = load i8*, i8** %40, align 8
  %42 = call noalias %struct._IO_FILE* @fopen(i8* noundef %41, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %42, %struct._IO_FILE** @key_file, align 8
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @key_file, align 8
  %44 = icmp ne %struct._IO_FILE* %43, null
  br i1 %44, label %47, label %45

45:                                               ; preds = %38
  %46 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.4, i64 0, i64 0))
  store i32 1, i32* %3, align 4
  br label %296

47:                                               ; preds = %38
  %48 = call i64 @time(i64* noundef null) #6
  %49 = trunc i64 %48 to i32
  store i32 %49, i32* %11, align 4
  %50 = load i32, i32* %11, align 4
  call void @srand(i32 noundef %50) #6
  %51 = call noalias i8* @malloc(i64 noundef 8) #6
  store i8* %51, i8** %13, align 8
  %52 = load i8*, i8** %13, align 8
  call void @generate_key(i8* noundef %52)
  %53 = load i8*, i8** %13, align 8
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @key_file, align 8
  %55 = call i64 @fwrite(i8* noundef %53, i64 noundef 1, i64 noundef 8, %struct._IO_FILE* noundef %54)
  %56 = trunc i64 %55 to i16
  store i16 %56, i16* %12, align 2
  %57 = load i16, i16* %12, align 2
  %58 = sext i16 %57 to i32
  %59 = icmp ne i32 %58, 8
  br i1 %59, label %60, label %65

60:                                               ; preds = %47
  %61 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.5, i64 0, i64 0))
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @key_file, align 8
  %63 = call i32 @fclose(%struct._IO_FILE* noundef %62)
  %64 = load i8*, i8** %13, align 8
  call void @free(i8* noundef %64) #6
  store i32 1, i32* %3, align 4
  br label %296

65:                                               ; preds = %47
  %66 = load i8*, i8** %13, align 8
  call void @free(i8* noundef %66) #6
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @key_file, align 8
  %68 = call i32 @fclose(%struct._IO_FILE* noundef %67)
  br label %295

69:                                               ; preds = %27
  %70 = load i8**, i8*** %5, align 8
  %71 = getelementptr inbounds i8*, i8** %70, i64 1
  %72 = load i8*, i8** %71, align 8
  %73 = call i32 @strcmp(i8* noundef %72, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0)) #5
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %81, label %75

75:                                               ; preds = %69
  %76 = load i8**, i8*** %5, align 8
  %77 = getelementptr inbounds i8*, i8** %76, i64 1
  %78 = load i8*, i8** %77, align 8
  %79 = call i32 @strcmp(i8* noundef %78, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %290

81:                                               ; preds = %75, %69
  %82 = load i32, i32* %4, align 4
  %83 = icmp ne i32 %82, 5
  br i1 %83, label %84, label %87

84:                                               ; preds = %81
  %85 = load i32, i32* %4, align 4
  %86 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([98 x i8], [98 x i8]* @.str.8, i64 0, i64 0), i32 noundef %85)
  store i32 1, i32* %3, align 4
  br label %296

87:                                               ; preds = %81
  %88 = load i8**, i8*** %5, align 8
  %89 = getelementptr inbounds i8*, i8** %88, i64 2
  %90 = load i8*, i8** %89, align 8
  %91 = call noalias %struct._IO_FILE* @fopen(i8* noundef %90, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0))
  store %struct._IO_FILE* %91, %struct._IO_FILE** @key_file, align 8
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @key_file, align 8
  %93 = icmp ne %struct._IO_FILE* %92, null
  br i1 %93, label %96, label %94

94:                                               ; preds = %87
  %95 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str.10, i64 0, i64 0))
  store i32 1, i32* %3, align 4
  br label %296

96:                                               ; preds = %87
  %97 = call noalias i8* @malloc(i64 noundef 8) #6
  store i8* %97, i8** %15, align 8
  %98 = load i8*, i8** %15, align 8
  %99 = load %struct._IO_FILE*, %struct._IO_FILE** @key_file, align 8
  %100 = call i64 @fread(i8* noundef %98, i64 noundef 1, i64 noundef 8, %struct._IO_FILE* noundef %99)
  %101 = trunc i64 %100 to i16
  store i16 %101, i16* %14, align 2
  %102 = load i16, i16* %14, align 2
  %103 = sext i16 %102 to i32
  %104 = icmp ne i32 %103, 8
  br i1 %104, label %105, label %109

105:                                              ; preds = %96
  %106 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([53 x i8], [53 x i8]* @.str.11, i64 0, i64 0))
  %107 = load %struct._IO_FILE*, %struct._IO_FILE** @key_file, align 8
  %108 = call i32 @fclose(%struct._IO_FILE* noundef %107)
  store i32 1, i32* %3, align 4
  br label %296

109:                                              ; preds = %96
  %110 = load %struct._IO_FILE*, %struct._IO_FILE** @key_file, align 8
  %111 = call i32 @fclose(%struct._IO_FILE* noundef %110)
  %112 = load i8**, i8*** %5, align 8
  %113 = getelementptr inbounds i8*, i8** %112, i64 3
  %114 = load i8*, i8** %113, align 8
  %115 = call noalias %struct._IO_FILE* @fopen(i8* noundef %114, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0))
  store %struct._IO_FILE* %115, %struct._IO_FILE** @input_file, align 8
  %116 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 8
  %117 = icmp ne %struct._IO_FILE* %116, null
  br i1 %117, label %120, label %118

118:                                              ; preds = %109
  %119 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([40 x i8], [40 x i8]* @.str.12, i64 0, i64 0))
  store i32 1, i32* %3, align 4
  br label %296

120:                                              ; preds = %109
  %121 = load i8**, i8*** %5, align 8
  %122 = getelementptr inbounds i8*, i8** %121, i64 4
  %123 = load i8*, i8** %122, align 8
  %124 = call noalias %struct._IO_FILE* @fopen(i8* noundef %123, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %124, %struct._IO_FILE** @output_file, align 8
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @output_file, align 8
  %126 = icmp ne %struct._IO_FILE* %125, null
  br i1 %126, label %129, label %127

127:                                              ; preds = %120
  %128 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([42 x i8], [42 x i8]* @.str.13, i64 0, i64 0))
  store i32 1, i32* %3, align 4
  br label %296

129:                                              ; preds = %120
  store i64 0, i64* %18, align 8
  %130 = call noalias i8* @malloc(i64 noundef 8) #6
  store i8* %130, i8** %20, align 8
  %131 = call noalias i8* @malloc(i64 noundef 8) #6
  store i8* %131, i8** %21, align 8
  %132 = call noalias i8* @malloc(i64 noundef 272) #6
  %133 = bitcast i8* %132 to %struct.key_set*
  store %struct.key_set* %133, %struct.key_set** %22, align 8
  %134 = call i64 @clock() #6
  store i64 %134, i64* %6, align 8
  %135 = load i8*, i8** %15, align 8
  %136 = load %struct.key_set*, %struct.key_set** %22, align 8
  call void @generate_sub_keys(i8* noundef %135, %struct.key_set* noundef %136)
  %137 = call i64 @clock() #6
  store i64 %137, i64* %7, align 8
  %138 = load i64, i64* %7, align 8
  %139 = load i64, i64* %6, align 8
  %140 = sub nsw i64 %138, %139
  %141 = sitofp i64 %140 to double
  %142 = fdiv double %141, 1.000000e+06
  store double %142, double* %8, align 8
  %143 = load i8**, i8*** %5, align 8
  %144 = getelementptr inbounds i8*, i8** %143, i64 1
  %145 = load i8*, i8** %144, align 8
  %146 = call i32 @strcmp(i8* noundef %145, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0)) #5
  %147 = icmp eq i32 %146, 0
  br i1 %147, label %148, label %150

148:                                              ; preds = %129
  store i16 1, i16* %17, align 2
  %149 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.14, i64 0, i64 0))
  br label %152

150:                                              ; preds = %129
  store i16 0, i16* %17, align 2
  %151 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.15, i64 0, i64 0))
  br label %152

152:                                              ; preds = %150, %148
  %153 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 8
  %154 = call i32 @fseek(%struct._IO_FILE* noundef %153, i64 noundef 0, i32 noundef 2)
  %155 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 8
  %156 = call i64 @ftell(%struct._IO_FILE* noundef %155)
  store i64 %156, i64* %9, align 8
  %157 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 8
  %158 = call i32 @fseek(%struct._IO_FILE* noundef %157, i64 noundef 0, i32 noundef 0)
  %159 = load i64, i64* %9, align 8
  %160 = udiv i64 %159, 8
  %161 = load i64, i64* %9, align 8
  %162 = urem i64 %161, 8
  %163 = icmp ne i64 %162, 0
  %164 = zext i1 %163 to i64
  %165 = select i1 %163, i32 1, i32 0
  %166 = sext i32 %165 to i64
  %167 = add i64 %160, %166
  store i64 %167, i64* %19, align 8
  %168 = call i64 @clock() #6
  store i64 %168, i64* %6, align 8
  br label %169

169:                                              ; preds = %269, %152
  %170 = load i8*, i8** %20, align 8
  %171 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 8
  %172 = call i64 @fread(i8* noundef %170, i64 noundef 1, i64 noundef 8, %struct._IO_FILE* noundef %171)
  %173 = icmp ne i64 %172, 0
  br i1 %173, label %174, label %271

174:                                              ; preds = %169
  %175 = load i64, i64* %18, align 8
  %176 = add i64 %175, 1
  store i64 %176, i64* %18, align 8
  %177 = load i64, i64* %18, align 8
  %178 = load i64, i64* %19, align 8
  %179 = icmp eq i64 %177, %178
  br i1 %179, label %180, label %259

180:                                              ; preds = %174
  %181 = load i16, i16* %17, align 2
  %182 = sext i16 %181 to i32
  %183 = icmp eq i32 %182, 1
  br i1 %183, label %184, label %235

184:                                              ; preds = %180
  %185 = load i64, i64* %9, align 8
  %186 = urem i64 %185, 8
  %187 = sub i64 8, %186
  %188 = trunc i64 %187 to i16
  store i16 %188, i16* %10, align 2
  %189 = load i16, i16* %10, align 2
  %190 = zext i16 %189 to i32
  %191 = icmp slt i32 %190, 8
  br i1 %191, label %192, label %206

192:                                              ; preds = %184
  %193 = load i8*, i8** %20, align 8
  %194 = getelementptr inbounds i8, i8* %193, i64 8
  %195 = load i16, i16* %10, align 2
  %196 = zext i16 %195 to i32
  %197 = sext i32 %196 to i64
  %198 = sub i64 0, %197
  %199 = getelementptr inbounds i8, i8* %194, i64 %198
  %200 = load i16, i16* %10, align 2
  %201 = trunc i16 %200 to i8
  %202 = zext i8 %201 to i32
  %203 = trunc i32 %202 to i8
  %204 = load i16, i16* %10, align 2
  %205 = zext i16 %204 to i64
  call void @llvm.memset.p0i8.i64(i8* align 1 %199, i8 %203, i64 %205, i1 false)
  br label %206

206:                                              ; preds = %192, %184
  %207 = load i8*, i8** %20, align 8
  %208 = load i8*, i8** %21, align 8
  %209 = load %struct.key_set*, %struct.key_set** %22, align 8
  %210 = load i16, i16* %17, align 2
  %211 = sext i16 %210 to i32
  call void @process_message(i8* noundef %207, i8* noundef %208, %struct.key_set* noundef %209, i32 noundef %211)
  %212 = load i8*, i8** %21, align 8
  %213 = load %struct._IO_FILE*, %struct._IO_FILE** @output_file, align 8
  %214 = call i64 @fwrite(i8* noundef %212, i64 noundef 1, i64 noundef 8, %struct._IO_FILE* noundef %213)
  %215 = trunc i64 %214 to i16
  store i16 %215, i16* %16, align 2
  %216 = load i16, i16* %10, align 2
  %217 = zext i16 %216 to i32
  %218 = icmp eq i32 %217, 8
  br i1 %218, label %219, label %234

219:                                              ; preds = %206
  %220 = load i8*, i8** %20, align 8
  %221 = load i16, i16* %10, align 2
  %222 = trunc i16 %221 to i8
  %223 = zext i8 %222 to i32
  %224 = trunc i32 %223 to i8
  call void @llvm.memset.p0i8.i64(i8* align 1 %220, i8 %224, i64 8, i1 false)
  %225 = load i8*, i8** %20, align 8
  %226 = load i8*, i8** %21, align 8
  %227 = load %struct.key_set*, %struct.key_set** %22, align 8
  %228 = load i16, i16* %17, align 2
  %229 = sext i16 %228 to i32
  call void @process_message(i8* noundef %225, i8* noundef %226, %struct.key_set* noundef %227, i32 noundef %229)
  %230 = load i8*, i8** %21, align 8
  %231 = load %struct._IO_FILE*, %struct._IO_FILE** @output_file, align 8
  %232 = call i64 @fwrite(i8* noundef %230, i64 noundef 1, i64 noundef 8, %struct._IO_FILE* noundef %231)
  %233 = trunc i64 %232 to i16
  store i16 %233, i16* %16, align 2
  br label %234

234:                                              ; preds = %219, %206
  br label %258

235:                                              ; preds = %180
  %236 = load i8*, i8** %20, align 8
  %237 = load i8*, i8** %21, align 8
  %238 = load %struct.key_set*, %struct.key_set** %22, align 8
  %239 = load i16, i16* %17, align 2
  %240 = sext i16 %239 to i32
  call void @process_message(i8* noundef %236, i8* noundef %237, %struct.key_set* noundef %238, i32 noundef %240)
  %241 = load i8*, i8** %21, align 8
  %242 = getelementptr inbounds i8, i8* %241, i64 7
  %243 = load i8, i8* %242, align 1
  %244 = zext i8 %243 to i16
  store i16 %244, i16* %10, align 2
  %245 = load i16, i16* %10, align 2
  %246 = zext i16 %245 to i32
  %247 = icmp slt i32 %246, 8
  br i1 %247, label %248, label %257

248:                                              ; preds = %235
  %249 = load i8*, i8** %21, align 8
  %250 = load i16, i16* %10, align 2
  %251 = zext i16 %250 to i32
  %252 = sub nsw i32 8, %251
  %253 = sext i32 %252 to i64
  %254 = load %struct._IO_FILE*, %struct._IO_FILE** @output_file, align 8
  %255 = call i64 @fwrite(i8* noundef %249, i64 noundef 1, i64 noundef %253, %struct._IO_FILE* noundef %254)
  %256 = trunc i64 %255 to i16
  store i16 %256, i16* %16, align 2
  br label %257

257:                                              ; preds = %248, %235
  br label %258

258:                                              ; preds = %257, %234
  br label %269

259:                                              ; preds = %174
  %260 = load i8*, i8** %20, align 8
  %261 = load i8*, i8** %21, align 8
  %262 = load %struct.key_set*, %struct.key_set** %22, align 8
  %263 = load i16, i16* %17, align 2
  %264 = sext i16 %263 to i32
  call void @process_message(i8* noundef %260, i8* noundef %261, %struct.key_set* noundef %262, i32 noundef %264)
  %265 = load i8*, i8** %21, align 8
  %266 = load %struct._IO_FILE*, %struct._IO_FILE** @output_file, align 8
  %267 = call i64 @fwrite(i8* noundef %265, i64 noundef 1, i64 noundef 8, %struct._IO_FILE* noundef %266)
  %268 = trunc i64 %267 to i16
  store i16 %268, i16* %16, align 2
  br label %269

269:                                              ; preds = %259, %258
  %270 = load i8*, i8** %20, align 8
  call void @llvm.memset.p0i8.i64(i8* align 1 %270, i8 0, i64 8, i1 false)
  br label %169, !llvm.loop !6

271:                                              ; preds = %169
  %272 = call i64 @clock() #6
  store i64 %272, i64* %7, align 8
  %273 = load i8*, i8** %15, align 8
  call void @free(i8* noundef %273) #6
  %274 = load i8*, i8** %20, align 8
  call void @free(i8* noundef %274) #6
  %275 = load i8*, i8** %21, align 8
  call void @free(i8* noundef %275) #6
  %276 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 8
  %277 = call i32 @fclose(%struct._IO_FILE* noundef %276)
  %278 = load %struct._IO_FILE*, %struct._IO_FILE** @output_file, align 8
  %279 = call i32 @fclose(%struct._IO_FILE* noundef %278)
  %280 = load i64, i64* %7, align 8
  %281 = load i64, i64* %6, align 8
  %282 = sub nsw i64 %280, %281
  %283 = sitofp i64 %282 to double
  %284 = fdiv double %283, 1.000000e+06
  store double %284, double* %8, align 8
  %285 = load i8**, i8*** %5, align 8
  %286 = getelementptr inbounds i8*, i8** %285, i64 3
  %287 = load i8*, i8** %286, align 8
  %288 = load double, double* %8, align 8
  %289 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([50 x i8], [50 x i8]* @.str.16, i64 0, i64 0), i8* noundef %287, double noundef %288)
  store i32 0, i32* %3, align 4
  br label %296

290:                                              ; preds = %75
  %291 = load i8**, i8*** %5, align 8
  %292 = getelementptr inbounds i8*, i8** %291, i64 1
  %293 = load i8*, i8** %292, align 8
  %294 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @.str.17, i64 0, i64 0), i8* noundef %293)
  store i32 1, i32* %3, align 4
  br label %296

295:                                              ; preds = %65
  store i32 0, i32* %3, align 4
  br label %296

296:                                              ; preds = %295, %290, %271, %127, %118, %105, %94, %84, %60, %45, %36, %25
  %297 = load i32, i32* %3, align 4
  ret i32 %297
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(i8* noundef, i8* noundef) #2

declare noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #1

; Function Attrs: nounwind
declare i64 @time(i64* noundef) #3

; Function Attrs: nounwind
declare void @srand(i32 noundef) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare void @generate_key(i8* noundef) #1

declare i64 @fwrite(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) #1

declare i32 @fclose(%struct._IO_FILE* noundef) #1

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

declare i64 @fread(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) #1

; Function Attrs: nounwind
declare i64 @clock() #3

declare void @generate_sub_keys(i8* noundef, %struct.key_set* noundef) #1

declare i32 @fseek(%struct._IO_FILE* noundef, i64 noundef, i32 noundef) #1

declare i64 @ftell(%struct._IO_FILE* noundef) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare void @process_message(i8* noundef, i8* noundef, %struct.key_set* noundef, i32 noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
