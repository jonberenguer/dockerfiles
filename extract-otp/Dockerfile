FROM python:latest

RUN pip install qrcode protobuf

RUN git clone https://github.com/scito/extract_otp_secret_keys.git

WORKDIR /extract_otp_secret_keys

ENTRYPOINT ["/bin/bash"]
