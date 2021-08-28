FROM public.ecr.aws/lambda/python:3.7 as build_stage

RUN yum install zip -y

RUN mkdir layer
WORKDIR /layer
COPY requirements.txt .
RUN  pip3 install -r requirements.txt -t python

RUN zip -r layer.zip .


FROM scratch as export_stage
COPY --from=build_stage /layer/layer.zip .


### https://docs.aws.amazon.com/lambda/latest/dg/images-create.html
# FROM public.ecr.aws/lambda/python:3.8

# # Copy function code
# COPY app.py ${LAMBDA_TASK_ROOT}

# # Install the function's dependencies using file requirements.txt
# # from your project folder.

# COPY requirements.txt  .
# RUN  pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# # Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
# CMD [ "app.handler" ] 