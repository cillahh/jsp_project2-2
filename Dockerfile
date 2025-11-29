# 톰캣 9.0 & JDK 17 버전 사용 (본인 프로젝트 버전에 맞춰 수정 가능)
FROM tomcat:9.0-jdk17-openjdk-slim

# 기존 톰캣의 ROOT 폴더 삭제 (내 프로젝트를 메인으로 쓰기 위함)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# 내 프로젝트(ROOT.war)를 톰캣 실행 폴더로 복사
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# 톰캣 실행
CMD ["catalina.sh", "run"]