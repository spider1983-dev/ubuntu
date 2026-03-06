자동 트레이딩 (LBank) — Python 예제

설명
- `ccxt`를 사용하여 LBank에 연결하고 간단한 EMA 크로스 전략으로 자동 매매를 실행합니다.

준비
1. 가상환경 생성 후 의존성 설치:

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

2. 환경 변수 복사 및 수정:

```bash
cp config.example.env .env
# .env 파일에 LBANK_API_KEY, LBANK_SECRET 값을 입력
```

3. 실행:

```bash
python run.py
```

주의
- 이 코드는 교육용 예제입니다. 실제 자금 운용 전 반드시 백테스트와 모의거래로 충분히 검증하세요.
- `TESTNET` 설정을 지원하는 계정에서만 안전하게 테스트하세요.
# ubuntu
